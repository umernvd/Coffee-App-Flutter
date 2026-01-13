import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeadingText extends StatelessWidget {
  final String text;

  const SubHeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.sora(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFA2A2A2), // Grey color from CSS
        height: 1.5,
        letterSpacing: 0.01,
      ),
    );
  }
}