import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/onboarding_item.dart';
import '../widgets/onboarding/slide_content.dart';
import '../widgets/onboarding/progress_indicator.dart';
import '../widgets/onboarding/custom_button.dart';
import './signup_screen.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload all onboarding images to prevent white flash
    for (var item in onboardingData) {
      precacheImage(AssetImage(item.image), context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // cancel timers to prevent memory leaks
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
          // The Carousel
          PageView.builder(
            controller: _pageController,
            allowImplicitScrolling: true,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              _timer?.cancel();
              _startAutoScroll();
            },
            itemBuilder: (context, index) {
              return SlideContent(item: onboardingData[index]);
            },
          ),

          // Bottom UI Section (Progress Bar + Button)
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
                    _timer?.cancel();
                    // Navigate to Home
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2), // Add spacing
                // New Login Button
                TextButton(
                  onPressed: () {
                    _timer?.cancel();
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
                      style: TextStyle(
                        fontFamily: GoogleFonts.sora().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000),
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            fontFamily: GoogleFonts.sora().fontFamily,
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
