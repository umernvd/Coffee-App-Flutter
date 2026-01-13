import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_button.dart'; // Reusing your existing button from Onboarding

class BottomPriceBar extends StatelessWidget {
  final String price;

  const BottomPriceBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: const Color(0xFF9B9B9B),
                ),
              ),
              Text(
                "\$ $price",
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 217, // Fixed width from design
            child: CustomButton(
              text: "Buy Now",
              onPressed: () {
                print("Buy Now Clicked");
              },
            ),
          ),
        ],
      ),
    );
  }
}