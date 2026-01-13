import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coffee_model.dart';
import '../widgets/home/search_bar_widget.dart';
import '../widgets/home/promo_banner.dart';
import '../widgets/home/coffee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // categories for selection
  final List<String> categories = [
    "All Coffee",
    "Machiato",
    "Latte",
    "Americano",
  ];
  String selectedCategory = "All Coffee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // Custom Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.home, color: Color(0xFFC67C4E), size: 30),
            const Icon(
              Icons.favorite_border,
              color: Color(0xFFA2A2A2),
              size: 28,
            ),
            const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFA2A2A2),
              size: 28,
            ),
            const Icon(
              Icons.notifications_none,
              color: Color(0xFFA2A2A2),
              size: 28,
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER SECTION (Stack used for Background + Banner overlay)
            SizedBox(
              height: 380, // Height to accommodate header + half banner
              child: Stack(
                children: [
                  // Dark Background Gradient
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF131313), Color(0xFF313131)],
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Location Label
                        Text(
                          "Location",
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Location Value
                        Row(
                          children: [
                            Text(
                              "Bilzen, Tanjungbalai",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                color: const Color(0xFFDDDDDD),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Search Bar Widget
                        const SearchBarWidget(),
                      ],
                    ),
                  ),

                  // Promo Banner (Positioned to overlap)
                  const Positioned(
                    top: 220,
                    left: 24,
                    right: 24,
                    child: PromoBanner(),
                  ),
                ],
              ),
            ),

            // CATEGORIES SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFC67C4E)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          category,
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2F2D2C),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // COFFEE GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable grid scrolling
                shrinkWrap: true, // Take only needed space
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7, // Adjust ratio for card height
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  return CoffeeCard(coffee: coffeeList[index]);
                },
              ),
            ),

            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
    );
  }
}
