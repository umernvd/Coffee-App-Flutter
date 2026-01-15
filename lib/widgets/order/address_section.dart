import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  final String addressTitle;
  final String addressSubtitle;
  final String note;
  final VoidCallback onEditAddress;
  final VoidCallback onAddNote;

  const AddressSection({
    super.key,
    required this.addressTitle,
    required this.addressSubtitle,
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
          const Text(
            "Delivery Address",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF242424), fontFamily: 'Sora'),
          ),
          const SizedBox(height: 12),
          Text(
            addressTitle,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF313131), fontFamily: 'Sora'),
          ),
          const SizedBox(height: 6),
          Text(
            addressSubtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xFFA2A2A2), fontFamily: 'Sora'),
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
                  note.isEmpty ? "Add Note" : "Note Added"
                ),
              ),
            ],
          ),
          // Show the note if it exists
          if (note.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              "Note: $note",
              style: const TextStyle(fontSize: 12, color: Color(0xFFC67C4E), fontFamily: 'Sora', fontStyle: FontStyle.italic),
            )
          ]
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
            style: const TextStyle(fontSize: 12, color: Color(0xFF313131), fontFamily: 'Sora'),
          ),
        ],
      ),
    );
  }
}