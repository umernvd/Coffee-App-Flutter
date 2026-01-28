import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomOrderBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onOrderPress; 

  const BottomOrderBar({
    super.key, 
    required this.totalPrice, 
    required this.onOrderPress, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
       
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.wallet, color: Color(0xFFC67C4E), size: 24),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash/Wallet",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: GoogleFonts.sora().fontFamily,
                        ),
                      ),
                      Text(
                        "\$ ${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC67C4E),
                          fontFamily: GoogleFonts.sora().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF242424)),
            ],
          ),
          const SizedBox(height: 16),
          
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: onOrderPress,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                             ),
              child: Text(
                "Order",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: GoogleFonts.sora().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}