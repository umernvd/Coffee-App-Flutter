import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/order/delivery_toggle.dart';
import '../widgets/order/address_section.dart';
import '../widgets/order/order_item_card.dart';
import '../widgets/order/discount_badge.dart';
import '../widgets/order/payment_summary.dart';
import '../widgets/order/bottom_order_bar.dart';

class OrderScreen extends StatefulWidget {
  final Coffee coffee;
  const OrderScreen({super.key, required this.coffee});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // 1. STATE VARIABLES
  int quantity = 1;
  // Combine title/subtitle into one main address variable
  String deliveryAddress = "Jl. Kpg Sutoyo No. 620, Bilzen, Tanjungbalai."; 
  String note = "No notes added"; // Default text for the note section

  // 2. CALCULATE PRICE LOGIC
  double get itemPrice => double.tryParse(widget.coffee.price) ?? 0.0;
  double get deliveryFee => 1.0;
  double get totalPrice => (itemPrice * quantity) + deliveryFee;

  // 3. DIALOG LOGIC (For editing Address or Note)
  void _showEditDialog(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontFamily: 'Sora')),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC67C4E)),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF242424), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DeliveryToggle(),
            
            // 4. UPDATED ADDRESS SECTION CALL
            AddressSection(
              address: deliveryAddress, // Maps to Bold Text
              note: note,               // Maps to Grey Text below it
              onEditAddress: () {
                _showEditDialog("Edit Address", deliveryAddress, (val) {
                  setState(() => deliveryAddress = val);
                });
              },
              onAddNote: () {
                _showEditDialog("Add Note", note, (val) {
                  setState(() => note = val);
                });
              },
            ),
            
            const Divider(height: 30, thickness: 1, color: Color(0xFFEAEAEA)),
            
            OrderItemCard(
              coffee: widget.coffee,
              quantity: quantity,
              onIncrement: () => setState(() => quantity++),
              onDecrement: () {
                if (quantity > 1) setState(() => quantity--);
              },
            ),
            
            const Divider(height: 30, thickness: 4, color: Color(0xFFF4F4F4)),
            const DiscountBadge(),
            
            PaymentSummary(
              itemPrice: itemPrice * quantity, // Dynamic Subtotal
              deliveryFee: deliveryFee,
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomOrderBar(totalPrice: totalPrice),
    );
  }
}