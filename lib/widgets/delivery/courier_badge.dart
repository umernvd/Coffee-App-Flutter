import 'package:flutter/material.dart';

class CourierBadge extends StatelessWidget {
  const CourierBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFEAEAEA)),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: const Image(image: AssetImage('assets/motorbike.png')),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivered your order",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424),
                    fontFamily: 'Sora',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "We deliver your goods to you in the shortest possible time.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFA2A2A2),
                    fontFamily: 'Sora',
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}