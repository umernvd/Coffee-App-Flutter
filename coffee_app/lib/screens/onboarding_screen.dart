import 'package:flutter/material.dart';
import '../widgets/heading_text.dart';
import '../widgets/sub_heading_text.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting screen height to size the image proportionally
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black, // Fallback background
      body: Stack(
        children: [
          // 1. Background Image (Top 60-65% of screen)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.65, // Takes up top 65%
            child: Image.asset(
              'assets/onboarding.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Black Gradient/Solid Overlay (Bottom part)
          // This covers the bottom and fades into the image slightly
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.45, // overlaps image slightly
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, 
                    Color(0xFF050505), // Dark Black from CSS
                    Color(0xFF050505),
                  ],
                  stops: [0.0, 0.2, 1.0], // Controls the fade
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Title
                    const HeadingText(
                      text: "Fall in Love with Coffee in Blissful Delight!",
                    ),
                    
                    const SizedBox(height: 8),

                    // Subtitle
                    const SubHeadingText(
                      text: "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                    ),

                    const SizedBox(height: 32),

                    // Button
                    CustomButton(
                      text: "Get Started",
                      onPressed: () {
                        // Navigate to next screen
                        print("Get Started Clicked");
                      },
                    ),

                    // Spacing for bottom safe area (home indicator)
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}