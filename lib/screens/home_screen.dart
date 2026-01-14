import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/home/promo_banner.dart';
import '../widgets/home/coffee_card.dart';
import '../widgets/home/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data for Categories
  final List<String> categories = [
    "All Coffee",
    "Cappuccino",
    "Espresso",
    "Latte",
    "Americano",
  ];

  // Data for Locations
  final List<String> cities = [
    "Karachi, Pakistan",
    "Lahore, Pakistan",
    "Islamabad, Pakistan",
    "Peshawar, Pakistan",
    "Quetta, Pakistan",
    "Multan, Pakistan",
  ];

  // State Variables
  String selectedCategory = "All Coffee";
  String selectedCity = "Lahore, Pakistan";
  String searchQuery = "";

  // Logic: Filter the list based on Category AND Search Text
  List<Coffee> get filteredCoffees {
    return coffeeList.where((coffee) {
      // 1. Check Category
      final matchesCategory =
          selectedCategory == "All Coffee" ||
          coffee.category == selectedCategory;

      // 2. Check Search
      final matchesSearch = coffee.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // Using CustomScrollView for advanced scrolling behavior and efficient grids
      body: CustomScrollView(
        slivers: [
          // --- HEADER SECTION (SliverToBoxAdapter) ---
          SliverToBoxAdapter(
            child: SizedBox(
              height: 380,
              child: Stack(
                children: [
                  // Dark Background
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
                        const Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFA2A2A2),
                            fontFamily: 'Sora',
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Location Dropdown
                        DropdownButton<String>(
                          value: selectedCity,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          dropdownColor: const Color(0xFFC67C4E),
                          underline: const SizedBox(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Sora',
                          ),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() => selectedCity = newValue);
                            }
                          },
                          items: cities.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Search Bar (Filter Button Removed)
                        Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() => searchQuery = value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Sora',
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "Search coffee",
                                    hintStyle: TextStyle(
                                      color: Color(0xFFA2A2A2),
                                      fontSize: 14,
                                      fontFamily: 'Sora',
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Promo Banner
                  const Positioned(
                    top: 220,
                    left: 24,
                    right: 24,
                    child: PromoBanner(),
                  ),
                ],
              ),
            ),
          ),

          // --- CATEGORIES SECTION (SliverToBoxAdapter) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 30,
                // Added bottom padding to separate from grid
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedCategory = category);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFC67C4E)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2F2D2C),
                            fontFamily: 'Sora',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Spacer between Categories and Grid
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // --- COFFEE GRID SECTION (SliverGrid) ---
          // This grid will take up the remaining space and scroll naturally
          filteredCoffees.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "No coffee found!",
                        style: TextStyle(fontFamily: 'Sora'),
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200, // Responsive width control
                          childAspectRatio: 0.65, // Matches your card design
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return CoffeeCard(coffee: filteredCoffees[index]);
                    }, childCount: filteredCoffees.length),
                  ),
                ),

          // Bottom Spacer to ensure content isn't hidden behind Nav Bar
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
