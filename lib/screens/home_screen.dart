import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coffee_model.dart';
import '../widgets/home/coffee_card.dart';
import '../widgets/home/location_search_header.dart';
import '../widgets/home/sticky_header_delegate.dart';
import '../repositories/coffee_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data
  final List<String> categories = [
    "All Coffee",
    "Cappuccino",
    "Espresso",
    "Latte",
    "Americano",
  ];
  final List<String> cities = [
    "Karachi, Pakistan",
    "Lahore, Pakistan",
    "Islamabad, Pakistan",
    "Peshawar, Pakistan",
    "Quetta, Pakistan",
    "Multan, Pakistan",
  ];

  // State
  String selectedCategory = "All Coffee";
  String selectedCity = "Lahore, Pakistan";
  String searchQuery = "";

  List<Coffee> _cachedCoffees = [];

  @override
  void initState() {
    super.initState();
    // Initial Filter run
    _filterCoffees();
  }

  // Filter Logic
  void _filterCoffees() {
    final allCoffees = CoffeeRepository().getCoffees();
    setState(() {
      _cachedCoffees = allCoffees.where((coffee) {
        final matchesCategory =
            selectedCategory == "All Coffee" ||
            coffee.category == selectedCategory;
        final matchesSearch = coffee.name.toLowerCase().contains(
          searchQuery.toLowerCase(),
        );
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = (size.width - 48 - 20) / 2;
    const double desiredItemHeight = 245;
    final double childAspectRatio = itemWidth / desiredItemHeight;
    // Status Bar Configuration (White Icons)
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: CustomScrollView(
          slivers: [
            // HEADER (Scrolls Away)
            SliverToBoxAdapter(
              child: LocationAndSearchHeader(
                selectedCity: selectedCity,
                cities: cities,
                onCityChanged: (val) {
                  if (val != null) setState(() => selectedCity = val);
                },
                onSearchChanged: (val) {
                  searchQuery = val;
                  _filterCoffees();
                },
              ),
            ),

            // STICKY HEADER (Pins Promo + Categories)
            SliverPersistentHeader(
              pinned: true,
              delegate: HomeStickyHeaderDelegate(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  selectedCategory = category;
                  _filterCoffees();
                },
              ),
            ),

            // COFFEE GRID
            _cachedCoffees.isEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Center(
                        child: Text(
                          "No coffee found!",
                          style: TextStyle(
                            fontFamily: GoogleFonts.sora().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: childAspectRatio,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            CoffeeCard(coffee: _cachedCoffees[index]),
                        childCount: _cachedCoffees.length,
                      ),
                    ),
                  ),

            // Bottom Spacer
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
