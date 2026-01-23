import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.sora(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.5,
        letterSpacing: 0.005,
      ),
    );
  }
}