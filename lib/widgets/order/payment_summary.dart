import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final double itemPrice;
  final double deliveryFee;

  const PaymentSummary({
    super.key, 
    required this.itemPrice, 
    required this.deliveryFee
  });

  @override
  Widget build(BuildContext context) {
    // Original price for strikethrough logic (Just mockup logic for now)
    const double originalDeliveryFee = 2.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
          ),
          const SizedBox(height: 12),
          
          _buildRow("Price", itemPrice),
          const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Delivery Fee",
                style: TextStyle(fontSize: 14, color: Color(0xFF313131), fontFamily: 'Sora'),
              ),
              Row(
                children: [
                  Text(
                    "\$ ${originalDeliveryFee.toStringAsFixed(1)} ",
                    style: const TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: Color(0xFF2A2A2A), fontFamily: 'Sora'),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "\$ ${deliveryFee.toStringAsFixed(1)}",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF313131), fontFamily: 'Sora'),
        ),
        Text(
          "\$ ${value.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
        ),
      ],
    );
  }
}