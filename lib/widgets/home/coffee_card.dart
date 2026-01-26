// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/coffee_model.dart';
import '../../providers/cart_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../screens/detail_screen.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    // Wrap everything in a GestureDetector for Navigation
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(coffee: coffee)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Rating Stack
            Stack(
              children: [
                // Hero animation for transition to detail screen
                Hero(
                  tag: 'coffee-${coffee.name}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      coffee.imageUrl,
                      height: 128,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: 500,
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFD17842),
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${coffee.rating}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            fontFamily: 'Sora',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Favorite Heart Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: Consumer<FavoritesProvider>(
                    builder: (context, favorites, child) {
                      final isLiked = favorites.isFavorite(coffee);
                      return GestureDetector(
                        onTap: () => favorites.toggleFavorite(coffee),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: AnimatedScale(
                            scale: isLiked ? 1.0 : 0.85,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    coffee.type,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${coffee.price}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                          fontFamily: 'Sora',
                        ),
                      ),
                      // Add Button
                      GestureDetector(
                        onTap: () {
                          context.read<CartProvider>().addToCart(coffee);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${coffee.name} added to cart!"),
                              duration: const Duration(milliseconds: 800),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
