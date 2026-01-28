import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/cart_item.dart';
import '../../providers/cart_provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              cartItem.coffee.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              cacheWidth: 200,
              cacheHeight: 200,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.coffee.name,
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  cartItem.coffee.type,
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontSize: 12,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$ ${cartItem.coffee.price}",
                  style: TextStyle(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xFFC67C4E),
                  ),
                ),
              ],
            ),
          ),

          Selector<CartProvider, int>(
            selector: (context, provider) {
              try {
                return provider.items
                    .firstWhere(
                      (item) => item.coffee.name == cartItem.coffee.name,
                    )
                    .quantity;
              } catch (e) {
                return 0;
              }
            },
            builder: (context, quantity, child) {
              return Row(
                children: [
                  _QuantityButton(
                    icon: Icons.remove,
                    onTap: () {
                      context.read<CartProvider>().removeFromCart(cartItem);
                    },
                  ),
                  SizedBox(
                    width: 30,
                    child: Text(
                      "$quantity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.sora().fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFFC67C4E),
                      ),
                    ),
                  ),
                  _QuantityButton(
                    icon: Icons.add,
                    onTap: () {
                      context.read<CartProvider>().addToCart(cartItem.coffee);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
