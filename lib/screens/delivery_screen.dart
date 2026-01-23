import 'package:flutter/material.dart';
import '../widgets/delivery/delivery_map.dart';
import '../widgets/delivery/delivery_top_buttons.dart';
import '../widgets/delivery/delivery_bottom_sheet.dart';

class DeliveryScreen extends StatelessWidget {
  final String deliveryAddress;

  const DeliveryScreen({super.key, required this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DeliveryMap(),
          const DeliveryTopButtons(),
          
          DeliveryBottomSheet(address: deliveryAddress),
        ],
      ),
    );
  }
}