import 'dart:async';
import 'package:coffee_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import '../services/storage_service.dart'; // Import Storage Service

class OrderProvider extends ChangeNotifier {
  int _quantity = 1;
  String _address = "";
  String _note = "No notes added";
  bool _showError = false;

  // Getters
  int get quantity => _quantity;
  String get address => _address;
  String get note => _note;
  bool get showError => _showError;
  double get deliveryFee => 1.0;

  // CONSTRUCTOR: Load data immediately when the provider is created
  OrderProvider() {
    _loadData();
  }

  // LOAD Data from Storage
  void _loadData() {
    final savedAddress = StorageService().getString('user_address');
    final savedNote = StorageService().getString('user_note');

    if (savedAddress != null && savedAddress.isNotEmpty) {
      _address = savedAddress;
    }
    if (savedNote != null && savedNote.isNotEmpty) {
      _note = savedNote;
    }
    notifyListeners();
  }

  // Setters & Actions
  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  // SAVE Address when updated
  void setAddress(String newAddress) {
    _address = newAddress;
    StorageService().setString('user_address', newAddress); // <--- Save to disk
    notifyListeners();
  }

  // SAVE Note when updated
  void setNote(String newNote) {
    _note = newNote;
    StorageService().setString('user_note', newNote); // <--- Save to disk
    notifyListeners();
  }

  // Calculates price for a single item flow (Detail -> Order)
  double calculateSingleItemTotal(String priceString) {
    final price = double.tryParse(priceString) ?? 0.0;
    return (price * _quantity) + deliveryFee;
  }

  // Calculates price for the cart flow (Cart -> Order)
  double calculateCartTotal(List<CartItem> cartItems) {
    double itemTotal = cartItems.fold(0, (sum, item) => sum + item.totalPrice);
    return itemTotal + deliveryFee;
  }

  bool validateOrder() {
    if (_address.isEmpty || _address == "Enter your delivery address") {
      _triggerError();
      return false;
    }
    return true;
  }

  void _triggerError() {
    _showError = true;
    notifyListeners();
    Timer(const Duration(seconds: 3), () {
      _showError = false;
      notifyListeners();
    });
  }
  
  // Reset state
  void reset() {
    _quantity = 1;
    // address/note persists across orders
    _showError = false;
  }
}