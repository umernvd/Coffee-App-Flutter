// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DeliveryMap extends StatelessWidget {
  const DeliveryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Map Background
          Positioned.fill(
            child: Image.asset('assets/maps.png', fit: BoxFit.cover),
          ),

          // Orange Route Line (Custom Drawing)
          Positioned.fill(child: CustomPaint(painter: RoutePainter())),

          // Start Location Pin (Target)
          const Positioned(
            left: 75,
            top: 245,
            child: Icon(
              Icons.location_on,
              color: Color(0xFFC67C4E),
              size: 32,
            ),
          ),

          // Driver Icon (Bike)
          Positioned(
            left: 233,
            top: 311,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/motorbike.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// This class draws the orange line on the screen
class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          const Color(0xFFC67C4E)
      ..strokeWidth =
          4 // Thickness from Figma
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded ends

    final path = Path();

    // trace the path visually
    // (Start near the Pin)
    path.moveTo(90, 275);

    // Draw the jagged steps
    path.lineTo(110, 275); // Right
    path.lineTo(110, 230); // Up
    path.lineTo(150, 230); // Right
    path.lineTo(150, 215); // Up
    path.lineTo(253, 215); // Long Right
    path.lineTo(253, 330); // Long Down to Driver

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
