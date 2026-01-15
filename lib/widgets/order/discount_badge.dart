import 'package:flutter/material.dart';

class DiscountBadge extends StatelessWidget {
  const DiscountBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Row(
        children: [
         Image.asset("assets/icons/discount.png", width: 16, height: 16),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "1 Discount is Applied",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF313131),
                fontFamily: 'Sora',
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}