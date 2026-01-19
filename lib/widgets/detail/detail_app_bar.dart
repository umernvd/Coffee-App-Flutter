import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/coffee_model.dart';
import '../../providers/favorites_provider.dart'; // Import Provider

class DetailAppBar extends StatelessWidget {
  final Coffee coffee; // Add this

  const DetailAppBar({super.key, required this.coffee}); // Add to constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            color: Theme.of(context).primaryColor, // Ensure it's Orange
          ),

          // Title
          Text(
            "Detail",
            style: Theme.of(context).textTheme.titleLarge,
          ),

          // FAVORITE HEART ICON
          Consumer<FavoritesProvider>(
            builder: (context, favorites, child) {
              final isLiked = favorites.isFavorite(coffee);
              return IconButton(
                onPressed: () => favorites.toggleFavorite(coffee),
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Theme.of(context).primaryColor : Colors.black,
                  size: 28,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}