import 'dart:convert'; // Required for JSON encoding/decoding
import 'package:flutter/foundation.dart';
import '../models/coffee_model.dart';
import '../models/cart_item.dart';
import '../services/storage_service.dart'; // Import storage service

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  // CONSTRUCTOR: Load the cart immediately when app starts
  CartProvider() {
    _loadCart();
  }

  // LOAD LOGIC (Deserialization)
  void _loadCart() {
    // Get the raw string from storage
    final String? cartString = StorageService().getString('cart_items');

    if (cartString != null && cartString.isNotEmpty) {
      try {
        // Decode the JSON string into a List of Maps
        final List<dynamic> jsonList = jsonDecode(cartString);

        // Convert each Map back into a CartItem object
        _items = jsonList.map((jsonItem) => CartItem.fromJson(jsonItem)).toList();
        
        notifyListeners();
      } catch (e) {
        // If data is corrupted, start with an empty list
        if (kDebugMode) {
          print("Error loading cart: $e");
        }
        _items = [];
      }
    }
  }

  // SAVE LOGIC (Serialization)
  void _saveCart() {
    // Convert List<CartItem> to List<Map>
    List<Map<String, dynamic>> jsonList = _items.map((item) => item.toJson()).toList();
    
    // Encode List<Map> to a single JSON String
    final String cartString = jsonEncode(jsonList);
    
    // Save to disk
    StorageService().setString('cart_items', cartString);
  }

  // ACTIONS
  void addToCart(Coffee coffee) {
    final index = _items.indexWhere((item) => item.coffee.name == coffee.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(coffee: coffee));
    }
    _saveCart(); // Auto-save trigger
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    _saveCart(); // Auto-save trigger
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    _saveCart(); // Auto-save trigger
    notifyListeners();
  }
}