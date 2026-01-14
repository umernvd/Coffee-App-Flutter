import 'package:flutter/material.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final int activeIndex;
  final int totalCount;

  const OnboardingProgressIndicator({
    super.key,
    required this.activeIndex,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) {
        // Check if this specific bar is the active one
        final isActive = index == activeIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300), // Smooth transition
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 4,
          // Active bar is longer (24px) and Green/Orange, Inactive is short (12px) and grey
          width: isActive ? 32 : 12, 
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFC67C4E) : const Color(0xFF4A4A4A),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}