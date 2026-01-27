import 'package:flutter/material.dart';
import '../../models/coffee_model.dart';

class OrderItemCard extends StatelessWidget {
  final Coffee coffee;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const OrderItemCard({
    super.key,
    required this.coffee,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              coffee.imageUrl,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424),
                    fontFamily: 'Sora',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$ ${coffee.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC67C4E),
                    fontFamily: 'Sora',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
