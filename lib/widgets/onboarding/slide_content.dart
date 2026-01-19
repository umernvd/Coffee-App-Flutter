// ignore_for_file: deprecated_member_use

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
          padding: const EdgeInsets.only(top: 100.0, left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
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