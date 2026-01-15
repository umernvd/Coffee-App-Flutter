import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/coffee_model.dart';

class InfoSection extends StatelessWidget {
  final Coffee coffee;

  const InfoSection({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Rating Row
          Text(
            coffee.name,
            style: GoogleFonts.sora(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.type,
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      color: const Color(0xFF9B9B9B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFBBE21), size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "${coffee.rating}",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C),
                        ),
                      ),
                      Text(
                        " (${coffee.reviewCount})",
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Feature Icons (Delivery, Bean, Milk)
              Row(
                children: [
                  Image.asset("assets/motorbike.png", width: 24, height: 24),
                  const SizedBox(width: 29),
                   Image.asset("assets/icons/bean.png", width: 24, height: 24),
                  const SizedBox(width: 29),
                  Image.asset("assets/icons/milk.png", width: 24, height: 24),
                ],
              )
            ],
          ),
          
          const SizedBox(height: 5),
          Divider(color: Colors.grey[200], thickness: 1),
          const SizedBox(height: 0),

          // Description
          Text(
            "Description",
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              text: coffee.description,
              style: GoogleFonts.sora(
                fontSize: 14,
                color: const Color(0xFF9B9B9B),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}