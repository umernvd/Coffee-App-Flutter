import 'package:coffee_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import '../../models/coffee_model.dart';
import '../../screens/order_screen.dart';
import '../onboarding/custom_button.dart';

class BottomPriceBar extends StatelessWidget {
  final Coffee coffee;

  const BottomPriceBar({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",

                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9B9B9B),
                  fontFamily: 'Sora',
                ),
              ),
              Text(
                "\$ ${coffee.price}", // Access price directly from the object
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC67C4E),
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
          SizedBox(
            width: 217,
            child: CustomButton(
              text: "Buy Now",
              onPressed: () {
                // Temporary single-item list for the "Buy Now" flow
                final singleItemCart = [CartItem(coffee: coffee, quantity: 1)];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderScreen(cartItems: singleItemCart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
