import 'package:flutter/material.dart';
import 'promo_banner.dart';

class HomeStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  HomeStickyHeaderDelegate({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  // Height Calculation: 
  // Banner (150) + Spacing (20) + Categories (30) + Bottom Padding (20) = 220
  final double _height = 220.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFFF9F9F9), // The white background for the bottom half
      child: Stack(
        children: [
          // This sits BEHIND the banner and matches the header color exactly.
          // It creates the "50% overlap" look.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 75, // Covers top 50% of the banner (150px / 2 = 75px)
            child: Container(
             color: const Color.fromARGB(255, 32, 32, 32), // Matches bottom of Gradient
            ),
          ),

          // Banner + Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Promo Banner (Sits on top of the black extension)
                const PromoBanner(),
                
                const SizedBox(height: 20),
                
                // Categories
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = category == selectedCategory;
                      return GestureDetector(
                        onTap: () => onCategorySelected(category),
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFC67C4E) : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  @override
  bool shouldRebuild(covariant HomeStickyHeaderDelegate oldDelegate) {
    return oldDelegate.selectedCategory != selectedCategory;
  }
}