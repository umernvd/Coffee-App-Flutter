import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourierProfile extends StatelessWidget {
  const CourierProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: const DecorationImage(
                image: AssetImage('assets/driver.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brooklyn Simmons",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF242424),
                  fontFamily: GoogleFonts.sora().fontFamily,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Personal Courier",
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFFA2A2A2),
                  fontFamily: GoogleFonts.sora().fontFamily,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFEAEAEA)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.phone, color: Color(0xFF242424)),
          ),
        ],
      ),
    );
  }
}