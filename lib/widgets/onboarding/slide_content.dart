import 'package:flutter/material.dart';
import '../../models/onboarding_item.dart';

class SlideContent extends StatelessWidget {
  final OnboardingItem item;

  const SlideContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Full Background Image
        Image.asset(
          item.image,
          fit: BoxFit.cover,
        ),

        // 2. Black Gradient Overlay (so text is readable)
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7), // Darker at bottom
                Colors.black,
              ],
              stops: const [0.5, 0.8, 1.0],
            ),
          ),
        ),

        // 3. Text Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA2A2A2),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}