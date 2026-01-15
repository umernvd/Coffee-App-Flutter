import 'dart:async';
import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/order/delivery_toggle.dart';
import '../widgets/order/address_section.dart';
import '../widgets/order/order_item_card.dart';
import '../widgets/order/discount_badge.dart';
import '../widgets/order/payment_summary.dart';
import '../widgets/order/bottom_order_bar.dart';
import 'delivery_screen.dart';

class OrderScreen extends StatefulWidget {
  final Coffee coffee;
  const OrderScreen({super.key, required this.coffee});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // 1. STATE VARIABLES
  int quantity = 1;
  // Initialize as empty string to trigger placeholder logic
  String deliveryAddress = ""; 
  String note = "No notes added";
  
  bool showError = false;

  // 2. CALCULATE PRICE LOGIC
  double get itemPrice => double.tryParse(widget.coffee.price) ?? 0.0;
  double get deliveryFee => 1.0;
  double get totalPrice => (itemPrice * quantity) + deliveryFee;

  // 3. DIALOG LOGIC (For editing Address or Note)
  void _showEditDialog(String title, String currentValue, Function(String) onSave) {
    // If value is the placeholder, don't pre-fill the text box
    TextEditingController controller = TextEditingController(
      text: currentValue == "Enter your delivery address" ? "" : currentValue
    );
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontFamily: 'Sora')),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Type here...", // Helper inside the dialog
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onSave(controller.text);
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC67C4E)),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // 4. VALIDATION LOGIC
  void _handleOrderPress() {
    if (deliveryAddress.isEmpty || deliveryAddress == "Enter your delivery address") {
      // Trigger Error
      setState(() {
        showError = true;
      });

      // Auto-dismiss after 3 seconds
      Timer(const Duration(seconds: 3), () {
        if (mounted) { // Check if screen is still active
          setState(() {
            showError = false;
          });
        }
      });
    } else {
      // Success - Navigate
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeliveryScreen(deliveryAddress: deliveryAddress),
        ),
      );
    }
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF242424),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF242424),
            fontFamily: 'Sora',
          ),
        ),
      ),
      body: Stack(
        children: [
          // The Main Content (Scrollable)
          SingleChildScrollView(
            child: Column(
              children: [
                const DeliveryToggle(),
                
                AddressSection(
                  // Logic: If empty, show placeholder. If not, show address.
                  address: deliveryAddress.isEmpty ? "Enter your delivery address" : deliveryAddress,
                  note: note,
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
                PaymentSummary(itemPrice: itemPrice * quantity, deliveryFee: deliveryFee),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // The Error Popup Overlay
          Positioned(
            top: 10,
            left: 24,
            right: 24,
            child: AnimatedOpacity(
              opacity: showError ? 1.0 : 0.0, // Smooth fade animation
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !showError, // Allows clicks to pass through when hidden
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E), // Coral color
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.error_outline, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Add your delivery address",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'Sora'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomOrderBar(
        totalPrice: totalPrice,
        onOrderPress: _handleOrderPress, 
      ),
    );
  }
}