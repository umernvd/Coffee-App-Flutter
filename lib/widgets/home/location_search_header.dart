import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationAndSearchHeader extends StatelessWidget {
  final String selectedCity;
  final List<String> cities;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<String> onSearchChanged;

  const LocationAndSearchHeader({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onCityChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Reduced height so it ends right after the Search Bar
      // Allowing the next sliver (Banner) to pull up closer visually
      height: 230,

      color: const Color.fromARGB(255, 32, 32, 32),

      padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end, // Push content to bottom
        children: [
          Text(
            "Location",
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFFA2A2A2),
              fontFamily: GoogleFonts.sora().fontFamily,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButton<String>(
            value: selectedCity,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            dropdownColor: const Color(0xFFC67C4E),
            underline: const SizedBox(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.sora().fontFamily,
            ),
            onChanged: onCityChanged,
            items: cities.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          const SizedBox(height: 20),
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    onChanged: onSearchChanged,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.sora().fontFamily,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search coffee",
                      hintStyle: TextStyle(
                        color: const Color(0xFFA2A2A2),
                        fontSize: 14,
                        fontFamily: GoogleFonts.sora().fontFamily,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
