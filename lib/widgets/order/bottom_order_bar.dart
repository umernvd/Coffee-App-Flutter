import 'package:flutter/material.dart';
import '../../screens/delivery_screen.dart';

class BottomOrderBar extends StatelessWidget {
  final double totalPrice;
  const BottomOrderBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        24,
        16,
        24,
        30,
      ), // Extra bottom padding for iOS home bar
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Wallet Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.wallet, color: Color(0xFFC67C4E), size: 24),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cash/Wallet",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF242424),
                          fontFamily: 'Sora',
                        ),
                      ),
                      Text(
                        "\$ ${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC67C4E),
                          fontFamily: 'Sora',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF242424)),
            ],
          ),
          const SizedBox(height: 16),
          // Order Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Order",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Sora',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
