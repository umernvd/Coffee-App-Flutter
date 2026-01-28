import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Expanded(
            child: Text(
              "1 Discount is Applied",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFC67C4E),
                fontFamily: GoogleFonts.sora().fontFamily,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}