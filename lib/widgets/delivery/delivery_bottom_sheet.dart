import 'package:flutter/material.dart';
import 'delivery_progress_bar.dart';
import 'courier_badge.dart';
import 'courier_profile.dart';

class DeliveryBottomSheet extends StatelessWidget {
  // 1. Add variable
  final String address;

  const DeliveryBottomSheet({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 310, 
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
            Container(
              width: 44,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
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
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA2A2A2),
                  fontFamily: 'Sora',
                ),
                children: [
                  const TextSpan(text: "Delivery to "),
                  
                  // 2. Use the dynamic address here
                  TextSpan(
                    text: address, // <--- CHANGED
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF242424),
                    ),
                  ),
                ],
              ),
            ),
            
            const DeliveryProgressBar(),
            const CourierBadge(),
            const CourierProfile(),
          ],
        ),
      ),
    );
  }
}