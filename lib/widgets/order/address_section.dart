import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressSection extends StatelessWidget {
  final String address;
  final String note;
  final VoidCallback onEditAddress;
  final VoidCallback onAddNote;

  const AddressSection({
    super.key,
    required this.address,
    required this.note,
    required this.onEditAddress,
    required this.onAddNote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address",
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600, 
              color: const Color.fromARGB(255, 0, 0, 0), 
              fontFamily: GoogleFonts.sora().fontFamily
            ),
          ),
          const SizedBox(height: 12),
          
          Text(
            address,
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.w600, 
              color: const Color(0xFFC67C4E), 
              fontFamily: GoogleFonts.sora().fontFamily
            ),
          ),
          
          const SizedBox(height: 6),
          
          Text(
            note,
            style: TextStyle(
              fontSize: 12, 
              color: const Color(0xFFA2A2A2), 
              fontFamily: GoogleFonts.sora().fontFamily
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              GestureDetector(
                onTap: onEditAddress,
                child: _buildOutlineButton(Icons.edit_note, "Edit Address"),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onAddNote,
                child: _buildOutlineButton(
                  Icons.note_add_outlined, 
                  "Add Note"
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutlineButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFA2A2A2)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: const Color(0xFF313131)),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12, 
              color: const Color(0xFF313131), 
              fontFamily: GoogleFonts.sora().fontFamily
            ),
          ),
        ],
      ),
    );
  }
}