import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/order/delivery_toggle.dart';
import '../widgets/order/address_section.dart';
import '../widgets/order/order_item_card.dart';
import '../widgets/order/discount_badge.dart';
import '../widgets/order/payment_summary.dart';
import '../widgets/order/bottom_order_bar.dart';

class OrderScreen extends StatelessWidget {
  final Coffee coffee;
  const OrderScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    // Basic safe parsing of price
    final double itemPrice = double.tryParse(coffee.price) ?? 0.0;
    final double totalPrice = itemPrice + 1.0; // +1.0 for delivery fee

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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF242424),
            fontFamily: 'Sora',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DeliveryToggle(),
            const AddressSection(),
            const Divider(height: 30, thickness: 1, color: Color(0xFFEAEAEA)),
            OrderItemCard(coffee: coffee),
            const Divider(height: 30, thickness: 4, color: Color(0xFFF4F4F4)), // Thicker divider
            const DiscountBadge(),
            PaymentSummary(itemPrice: itemPrice),
            const SizedBox(height: 10), // Space for bottom bar
          ],
        ),
      ),
      bottomNavigationBar: BottomOrderBar(totalPrice: totalPrice),
    );
  }
}