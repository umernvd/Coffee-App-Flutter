import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryToggle extends StatefulWidget {
  const DeliveryToggle({super.key});

  @override
  State<DeliveryToggle> createState() => _DeliveryToggleState();
}

class _DeliveryToggleState extends State<DeliveryToggle> {
  bool isDeliver = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildOption("Deliver", isDeliver),
          _buildOption("Pick Up", !isDeliver),
        ],
      ),
    );
  }

  Widget _buildOption(String text, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDeliver = text == "Deliver";
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFC67C4E) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? Colors.white : const Color(0xFF242424),
              fontFamily: GoogleFonts.sora().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}