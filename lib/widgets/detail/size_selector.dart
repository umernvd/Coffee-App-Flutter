import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  // 0 = Small, 1 = Medium, 2 = Large
  int _selectedIndex = 1; 

  final List<String> sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              final isSelected = _selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index == 2 ? 0 : 12
                    ), // Spacing between buttons
                    height: 43,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFF9F5F2) : Colors.white,
                      border: Border.all(
                        color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFEAEAEA),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      sizes[index],
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF2F2D2C),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}