import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_border_rounded,
            size: 80,
            color: Color(0xFFD17842),
          ),
          const SizedBox(height: 24),
          Text(
            "No Favorites Yet",
            style: TextStyle(
              fontFamily: GoogleFonts.sora().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFD17842),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap the heart icon on any coffee\nto save it for later!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.sora().fontFamily,
              fontSize: 14,
              color: const Color.fromARGB(255, 0, 0, 0),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}