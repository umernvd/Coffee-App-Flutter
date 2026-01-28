import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart/cart_item_card.dart';
import '../screens/order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
          style: TextStyle(
            fontFamily: GoogleFonts.sora().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFD17842),
          ),
        ),
      ),
      body: Column(
        children: [
          // LIST SECTION
          Expanded(
            child: Selector<CartProvider, int>(
              selector: (context, provider) => provider.items.length,
              builder: (context, itemCount, child) {
                if (itemCount == 0) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          size: 80,
                          color: Color(0xFFD17842),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No item in your cart",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.sora().fontFamily,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final items = context.read<CartProvider>().items;

                return ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return CartItemCard(cartItem: items[index]);
                  },
                );
              },
            ),
          ),

          // TOTAL & CHECKOUT SECTION
          Consumer<CartProvider>(
            builder: (context, cart, _) {
              if (cart.items.isEmpty) return const SizedBox.shrink();

              return Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 16,
                            color:const Color(0xFF000000),
                            fontFamily: GoogleFonts.sora().fontFamily,
                          ),
                        ),
                        Text(
                          "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFC67C4E),
                            fontFamily: GoogleFonts.sora().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderScreen(cartItems: cart.items),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
