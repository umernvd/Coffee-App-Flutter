import 'package:flutter/material.dart';
import '../models/coffee_model.dart';

// Simple model for a Cart Item
class CartItem {
  final Coffee coffee;
  int quantity;

  CartItem({required this.coffee, this.quantity = 1});
}

// The Service that manages the cart data
class CartService {
  // Singleton pattern: Ensures we only have ONE cart in the entire app
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  // The list of items, accessible via a Listener
  final ValueNotifier<List<CartItem>> cartItems = ValueNotifier([]);

  // Add item to cart
  void addToCart(Coffee coffee) {
    final currentList = cartItems.value;
    
    // Check if item already exists
    final existingIndex = currentList.indexWhere((item) => item.coffee.name == coffee.name);
    
    if (existingIndex != -1) {
      // If exists, just increase quantity
      currentList[existingIndex].quantity++;
    } else {
      // If new, add to list
      currentList.add(CartItem(coffee: coffee));
    }
    
    // Notify listeners to update UI
    // We create a new list reference so Flutter knows something changed
    cartItems.value = List.from(currentList); 
  }

  // Remove item or decrease quantity
  void removeFromCart(CartItem item) {
    final currentList = cartItems.value;
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      currentList.remove(item);
    }
    cartItems.value = List.from(currentList);
  }

  // Calculate Total Price
  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems.value) {
      total += (double.parse(item.coffee.price) * item.quantity);
    }
    return total;
  }
}