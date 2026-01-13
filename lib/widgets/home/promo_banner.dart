import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFC67C4E).withOpacity(0.8), // Fallback color
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/banner.png'), // Add this to assets
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFED5151), // Red Badge
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Promo",
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Buy one get\none FREE",
              style: GoogleFonts.sora(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 32,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}