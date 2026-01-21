import 'package:flutter/material.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 80,
            color: Color(0xFFD17842),
          ),
          SizedBox(height: 24),
          Text(
            "No Favorites Yet",
            style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD17842),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Tap the heart icon on any coffee\nto save it for later!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}