import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/detail/detail_app_bar.dart';
import '../widgets/detail/item_image.dart';
import '../widgets/detail/info_section.dart';
import '../widgets/detail/size_selector.dart';
import '../widgets/detail/bottom_price_bar.dart';

class DetailScreen extends StatelessWidget {
  // This variable holds the data passed from Home Screen
  final Coffee coffee; 

  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        bottom: false, // Allows content to go behind bottom bar area if needed
        child: Column(
          children: [
            // 1. App Bar
            const DetailAppBar(),
            
            // 2. Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemImage(imageUrl: coffee.imageUrl),
                    InfoSection(coffee: coffee),
                    const SizeSelector(),
                    // Add some padding at bottom so content isn't hidden behind the sticky bar
                    const SizedBox(height: 20), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // 3. Fixed Bottom Bar
      bottomNavigationBar: BottomPriceBar(price: coffee.price),
    );
  }
}