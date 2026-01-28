import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String currentValue;
  final TextEditingController controller;
  final bool isEditing;
  final TextInputType keyboardType;

  const ProfileField({
    super.key,
    required this.label,
    required this.currentValue,
    required this.controller,
    required this.isEditing,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            fontFamily: GoogleFonts.sora().fontFamily,
            fontSize: 12,
            color: const Color(0xFFC67C4E),
          ),
        ),
        const SizedBox(height: 8),

        // Value or Input Field
        isEditing
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEAEAEA)),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
                ),
                child: Text(
                  currentValue,
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                ),
              ),
      ],
    );
  }
}
