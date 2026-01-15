import 'package:flutter/material.dart';
import '../widgets/delivery/delivery_map.dart';
import '../widgets/delivery/delivery_top_buttons.dart';
import '../widgets/delivery/delivery_bottom_sheet.dart';

class DeliveryScreen extends StatelessWidget {
  // 1. Add this variable
  final String deliveryAddress;

  // 2. Add it to the constructor
  const DeliveryScreen({super.key, required this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DeliveryMap(),
          const DeliveryTopButtons(),
          
          // 3. Pass it to the bottom sheet
          DeliveryBottomSheet(address: deliveryAddress),
        ],
      ),
    );
  }
}