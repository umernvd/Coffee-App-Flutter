import 'package:flutter/material.dart';
import '../../models/coffee_model.dart';
import '../../screens/order_screen.dart';
import '../custom_button.dart';

class BottomPriceBar extends StatelessWidget {
  // 1. Declare the Coffee object properly
  final Coffee coffee;

  // 2. Removed redundant 'price' string. We just need the coffee object.
  const BottomPriceBar({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        // 3. Restored design details (Rounded Top & Shadow)
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                // 4. Use offline TextStyle to prevent crashes
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Now this works because we have the 'coffee' object
                    builder: (context) => OrderScreen(coffee: coffee), 
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