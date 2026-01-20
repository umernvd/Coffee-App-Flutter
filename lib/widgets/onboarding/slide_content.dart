// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../models/onboarding_item.dart';

class SlideContent extends StatefulWidget {
  final OnboardingItem item;

  const SlideContent({super.key, required this.item});

  @override
  State<SlideContent> createState() => _SlideContentState();
}

class _SlideContentState extends State<SlideContent> with AutomaticKeepAliveClientMixin {
  // 1. Keep this page alive in memory so it doesn't reload and flicker
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // 2. Must call super.build

    return Container(
      color: Colors.black, // 3. Ensure background is black to hide any load frames
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Full Background Image
          Image.asset(
            widget.item.image,
            fit: BoxFit.cover,
            gaplessPlayback: true, // Prevents clearing during reload
            // Smooth fade-in for the very first load
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),

          // 2. Black Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
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
                  widget.item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.item.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 1.5,
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