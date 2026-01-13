import 'package:flutter/material.dart';
import '../../models/coffee_model.dart';

class OrderItemCard extends StatefulWidget {
  final Coffee coffee;
  const OrderItemCard({super.key, required this.coffee});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.coffee.imageUrl,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coffee.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424),
                    fontFamily: 'Sora',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Deep Foam", // Hardcoded per design, or use coffee.type
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFA2A2A2),
                    fontFamily: 'Sora',
                  ),
                ),
              ],
            ),
          ),
          // Counter
          Row(
            children: [
              _buildCounterButton(Icons.remove, () {
                if (quantity > 1) setState(() => quantity--);
              }),
              const SizedBox(width: 14),
              Text(
                "$quantity",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Sora',
                ),
              ),
              const SizedBox(width: 14),
              _buildCounterButton(Icons.add, () {
                setState(() => quantity++);
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFA2A2A2)),
          color: Colors.white,
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF2A2A2A)),
      ),
    );
  }
}