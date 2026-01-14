import 'package:flutter/material.dart';
import '../widgets/delivery/delivery_map.dart';
import '../widgets/delivery/delivery_top_buttons.dart';
import '../widgets/delivery/delivery_bottom_sheet.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Background Map
          DeliveryMap(),
          
          // Top Buttons
          DeliveryTopButtons(),
          
          // Bottom Information Panel
          DeliveryBottomSheet(),
        ],
      ),
    );
  }
}