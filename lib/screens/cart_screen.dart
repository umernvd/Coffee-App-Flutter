import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../screens/order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).primaryColor, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      // Uses the new Provider (Consumer)
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          
          // EMPTY STATE
          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  const Text(
                    "No item in your cart",
                    style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Sora'),
                  ),
                ],
              ),
            );
          }

          // LIST STATE
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          // Coffee Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(item.coffee.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          
                          // Coffee Name & Price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.coffee.name,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$ ${item.coffee.price}",
                                  style: TextStyle(
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w600, 
                                    color: Theme.of(context).primaryColor, 
                                    fontFamily: 'Sora'
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Counter Buttons (Corrected: Only one row of buttons)
                          Row(
                            children: [
                              _iconButton(Icons.remove, () => cart.removeFromCart(item)),
                              const SizedBox(width: 12),
                              Text(
                                "${item.quantity}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 12),
                              _iconButton(Icons.add, () => cart.addToCart(item.coffee)),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              // BOTTOM SUMMARY SECTION
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Price", style: TextStyle(fontSize: 16, fontFamily: 'Sora')),
                        Text(
                          "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18, 
                            fontWeight: FontWeight.w600, 
                            color: Theme.of(context).primaryColor, 
                            fontFamily: 'Sora'
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
                              builder: (context) => OrderScreen(cartItems: cart.items),
                            ),
                          );
                        },
                        child: const Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper widget for the +/- buttons
  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}