// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:coffee_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
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
  @override
  void initState() {
    super.initState();
    // Reset provider state when entering screen
    Future.microtask(() => context.read<OrderProvider>().reset());
  }

  void _showEditDialog(
    String title,
    String currentValue,
    Function(String) onSave,
  ) {
    TextEditingController controller = TextEditingController(
      text: currentValue == "Enter your delivery address" ? "" : currentValue,
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Type here...",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Color(0xFF000000))),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Consume the OrderProvider
    final orderProvider = context.watch<OrderProvider>();

    // Calculate total dynamically
    final double subtotal = widget.cartItems.fold(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );
    final double finalTotal = subtotal + orderProvider.deliveryFee;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Order", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const DeliveryToggle(),

                AddressSection(
                  address: orderProvider.address.isEmpty
                      ? "Enter your delivery address"
                      : orderProvider.address,
                  note: orderProvider.note,
                  onEditAddress: () {
                    _showEditDialog(
                      "Edit Address",
                      orderProvider.address,
                      (val) => orderProvider.setAddress(val),
                    );
                  },
                  onAddNote: () {
                    _showEditDialog(
                      "Add Note",
                      orderProvider.note,
                      (val) => orderProvider.setNote(val),
                    );
                  },
                ),

                const Divider(
                  height: 30,
                  thickness: 1,
                  color: Color(0xFFEAEAEA),
                ),

                // Render List of Items
                ...widget.cartItems.map((item) {
                  return OrderItemCard(
                    coffee: item.coffee,
                    quantity: item.quantity,
                    // Use context.read to call methods on the CartProvider without rebuilding the whole screen
                    onIncrement: () {
                      context.read<CartProvider>().addToCart(item.coffee);
                      // The OrderScreen will automatically rebuild because it's watching the CartProvider
                      // via the Consumer in CartScreen that pushed this route, or if we wrap this in a Consumer.
                      // For now, let's rely on the provider notification.
                      setState(
                        () {},
                      ); // Force a rebuild to show the updated total price immediately
                    },
                    onDecrement: () {
                      context.read<CartProvider>().removeFromCart(item);
                      setState(
                        () {},
                      ); // Force a rebuild to show the updated total price immediately
                    },
                  );
                }),

                const Divider(
                  height: 30,
                  thickness: 4,
                  color: Color(0xFFF4F4F4),
                ),
                const DiscountBadge(),

                PaymentSummary(
                  itemPrice: subtotal,
                  deliveryFee: orderProvider.deliveryFee,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Error Overlay
          Positioned(
            top: 10,
            left: 24,
            right: 24,
            child: AnimatedOpacity(
              opacity: orderProvider.showError ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !orderProvider.showError,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Add your delivery address",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
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
        totalPrice: finalTotal,
        onOrderPress: () {
          if (orderProvider.validateOrder()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DeliveryScreen(deliveryAddress: orderProvider.address),
              ),
            );
          }
        },
      ),
    );
  }
}
