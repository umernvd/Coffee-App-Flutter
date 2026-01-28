import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/favorites/favorite_coffee_card.dart';
import '../widgets/favorites/empty_favorites_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // RESPONSIVE GRID LOGIC like Home Screen
    var size = MediaQuery.of(context).size;
    final double itemWidth = (size.width - 48 - 20) / 2;
    const double desiredItemHeight = 245; 
    final double childAspectRatio = itemWidth / desiredItemHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favorites = favoritesProvider.favorites;

          return CustomScrollView(
            slivers: [
              // Sticky App Bar
              SliverAppBar(
                backgroundColor: const Color(0xFFF9F9F9),
                elevation: 0,
                pinned: true,
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  "Favorites",
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFD17842),
                  ),
                ),
              ),

              // Content Logic
              if (favorites.isEmpty)
                // Fill remaining space with Empty View if no items
                const SliverFillRemaining(
                  child: EmptyFavoritesView(),
                )
              else
                // Show Grid if items exist
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return FavoriteCoffeeCard(coffee: favorites[index]);
                      },
                      childCount: favorites.length,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}