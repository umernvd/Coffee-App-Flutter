import 'package:flutter/material.dart';
import '../models/coffee_model.dart';

class CartItem {
  final Coffee coffee;
  int quantity;

  CartItem({required this.coffee, this.quantity = 1});

  double get totalPrice => (double.tryParse(coffee.price) ?? 0.0) * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addToCart(Coffee coffee) {
    final index = _items.indexWhere((item) => item.coffee.name == coffee.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(coffee: coffee));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}