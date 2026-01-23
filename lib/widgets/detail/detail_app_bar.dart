import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/coffee_model.dart';
import '../../providers/favorites_provider.dart';

class DetailAppBar extends StatelessWidget {
  final Coffee coffee;

  const DetailAppBar({super.key, required this.coffee});

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
            color: Theme.of(context).primaryColor,
          ),

          // Title
          Text("Detail", style: Theme.of(context).textTheme.titleLarge),

          // FAVORITE HEART ICON
          Consumer<FavoritesProvider>(
            builder: (context, favorites, child) {
              final isLiked = favorites.isFavorite(coffee);
              return IconButton(
                onPressed: () => favorites.toggleFavorite(coffee),
                icon: AnimatedScale(
                  scale: isLiked ? 1.05 : 0.9,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    size: 28,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
