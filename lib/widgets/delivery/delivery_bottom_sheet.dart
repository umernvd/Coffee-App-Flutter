import 'package:flutter/material.dart';
import 'delivery_progress_bar.dart';
import 'courier_badge.dart';
import 'courier_profile.dart';

class DeliveryBottomSheet extends StatelessWidget {
  const DeliveryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 325, // Fixed height per design aspect ratio
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              width: 44,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            // Header Text
            const Text(
              "10 minutes left",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF242424),
                fontFamily: 'Sora',
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA2A2A2),
                  fontFamily: 'Sora',
                ),
                children: [
                  TextSpan(text: "Delivery to "),
                  TextSpan(
                    text: "Jl. Kpg Sutoyo",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF242424),
                    ),
                  ),
                ],
              ),
            ),
            
            // Widgets
            const DeliveryProgressBar(),
            const CourierBadge(),
            const CourierProfile(),
          ],
        ),
      ),
    );
  }
}