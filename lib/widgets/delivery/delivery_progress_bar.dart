import 'package:flutter/material.dart';

class DeliveryProgressBar extends StatelessWidget {
  const DeliveryProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _buildBar(isActive: true),
          const SizedBox(width: 10),
          _buildBar(isActive: true),
          const SizedBox(width: 10),
          _buildBar(isActive: true),
          const SizedBox(width: 10),
          _buildBar(isActive: false),
        ],
      ),
    );
  }

  Widget _buildBar({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF36C07E) : const Color(0xFFDFDFDF),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}