import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartBadgeIcon extends StatelessWidget {
  const CartBadgeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // Selector listens only to the item count
    return Selector<CartProvider, int>(
      selector: (_, provider) => provider.items.length,
      builder: (context, itemCount, child) {
        return Badge(
          isLabelVisible: itemCount > 0,
          label: Text(itemCount.toString()),
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: const Icon(Icons.shopping_bag_outlined, size: 30),
        );
      },
    );
  }
}
