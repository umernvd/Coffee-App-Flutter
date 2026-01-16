import 'dart:async';
import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../widgets/order/delivery_toggle.dart';
import '../widgets/order/address_section.dart';
import '../widgets/order/order_item_card.dart';
import '../widgets/order/discount_badge.dart';
import '../widgets/order/payment_summary.dart';
import '../widgets/order/bottom_order_bar.dart';
import 'delivery_screen.dart';

class OrderScreen extends StatefulWidget {
  final List<CartItem> cartItems; 
  
  const OrderScreen({super.key, required this.cartItems});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Address State
  String deliveryAddress = ""; 
  String note = "No notes added";
  bool showError = false;

  // 1. CALCULATE TOTAL PRICE LOGIC
  // We loop through all items to get the sum
  double get itemPrice {
    double total = 0.0;
    for (var item in widget.cartItems) {
      double price = double.tryParse(item.coffee.price) ?? 0.0;
      total += (price * item.quantity);
    }
    return total;
  }

  double get deliveryFee => 1.0;
  double get totalPrice => itemPrice + deliveryFee;

  // 2. DIALOG LOGIC (Keep as is)
  void _showEditDialog(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(
      text: currentValue == "Enter your delivery address" ? "" : currentValue
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontFamily: 'Sora')),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Type here..."),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) onSave(controller.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC67C4E)),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // 3. VALIDATION LOGIC
  void _handleOrderPress() {
    if (deliveryAddress.isEmpty || deliveryAddress == "Enter your delivery address") {
      setState(() => showError = true);
      Timer(const Duration(seconds: 3), () {
        if (mounted) setState(() => showError = false);
      });
    } else {
      // Clear cart after successful order (Optional but recommended)
      // CartService().cartItems.value = []; 
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeliveryScreen(deliveryAddress: deliveryAddress)),
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
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF242424), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const DeliveryToggle(),
                
                AddressSection(
                  address: deliveryAddress.isEmpty ? "Enter your delivery address" : deliveryAddress,
                  note: note,
                  onEditAddress: () {
                    _showEditDialog("Edit Address", deliveryAddress, (val) => setState(() => deliveryAddress = val));
                  },
                  onAddNote: () {
                    _showEditDialog("Add Note", note, (val) => setState(() => note = val));
                  },
                ),
                
                const Divider(height: 30, thickness: 1, color: Color(0xFFEAEAEA)),
                
                // 4. DYNAMIC LIST OF ITEMS
                // Instead of one OrderItemCard, we map the list
                ...widget.cartItems.map((item) {
                  return OrderItemCard(
                    coffee: item.coffee,
                    quantity: item.quantity,
                    onIncrement: () {
                      setState(() {
                         item.quantity++; // Simple local update for visual feedback
                         // NOTE: Ideally you should update CartService here too
                      });
                    },
                    onDecrement: () {
                      if (item.quantity > 1) {
                        setState(() => item.quantity--);
                      }
                    },
                  );
                }), // .toList() is not needed with spread operator (...)
                
                const Divider(height: 30, thickness: 4, color: Color(0xFFF4F4F4)),
                const DiscountBadge(),
                PaymentSummary(itemPrice: itemPrice, deliveryFee: deliveryFee),
              ],
            ),
          ),

          // Error Popup
          Positioned(
            top: 10, left: 24, right: 24,
            child: AnimatedOpacity(
              opacity: showError ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !showError,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.error_outline, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text("Add your delivery address", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'Sora')),
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