import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSummary extends StatelessWidget {
  final double itemPrice;
  final double deliveryFee;

  const PaymentSummary({
    super.key, 
    required this.itemPrice, 
    required this.deliveryFee
  });

  @override
  Widget build(BuildContext context) {
    // Original price for strikethrough logic
    const double originalDeliveryFee = 2.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontFamily: GoogleFonts.sora().fontFamily,
            ),
          ),
          const SizedBox(height: 12),
          
          _buildRow("Price", itemPrice),
          const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF313131),
                  fontFamily: GoogleFonts.sora().fontFamily,
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$ ${originalDeliveryFee.toStringAsFixed(1)} ",
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: const Color(0xFF2A2A2A),
                      fontFamily: GoogleFonts.sora().fontFamily,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "\$ ${deliveryFee.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF242424),
                      fontFamily: GoogleFonts.sora().fontFamily,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFF313131),
            fontFamily: GoogleFonts.sora().fontFamily,
          ),
        ),
        Text(
          "\$ ${value.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF242424),
            fontFamily: GoogleFonts.sora().fontFamily,
          ),
        ),
      ],
    );
  }
}