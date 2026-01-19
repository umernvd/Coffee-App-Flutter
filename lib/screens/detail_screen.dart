import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/detail/detail_app_bar.dart';
import '../widgets/detail/item_image.dart';
import '../widgets/detail/info_section.dart';
import '../widgets/detail/size_selector.dart';
import '../widgets/detail/bottom_price_bar.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // PASS THE COFFEE OBJECT HERE
            DetailAppBar(coffee: coffee),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemImage(imageUrl: coffee.imageUrl),
                    InfoSection(coffee: coffee),
                    const SizeSelector(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomPriceBar(coffee: coffee),
    );
  }
}