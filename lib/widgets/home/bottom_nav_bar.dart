import 'package:flutter/material.dart';
import '../../screens/cart_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/home.png', width: 24, height: 24),
          Image.asset('assets/icons/heart.png', width: 24, height: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            child: Image.asset('assets/icons/bag.png', width: 24, height: 24),
          ),
          Image.asset('assets/icons/notification.png', width: 24, height: 24),
        ],
      ),
    );
  }
}
