import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import '../models/onboarding_item.dart';
import '../widgets/onboarding/slide_content.dart';
import '../widgets/onboarding/progress_indicator.dart';
import '../widgets/custom_button.dart';
import './home_screen.dart';
import './login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller to handle page swipes programmatically
  final PageController _pageController = PageController();

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Always cancel timers to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  // Logic to auto-scroll every 3 seconds
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < onboardingData.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Loop back to start
      }

      // Animate to the next page
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. The Carousel
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return SlideContent(item: onboardingData[index]);
            },
          ),

          // 2. Bottom UI Section (Progress Bar + Button)
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Column(
              children: [
                // Progress Indicator
                OnboardingProgressIndicator(
                  activeIndex: _currentIndex,
                  totalCount: onboardingData.length,
                ),

                const SizedBox(height: 12),

                // Get Started Button
                CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    // Navigate to Home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 0), // Add spacing
                // New Login Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167),
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
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
