import 'dart:async';
import 'package:flutter/material.dart';
import 'cart_provider.dart';

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

  void setAddress(String newAddress) {
    _address = newAddress;
    notifyListeners();
  }

  void setNote(String newNote) {
    _note = newNote;
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
  
  // Reset state when leaving the screen
  void reset() {
    _quantity = 1;
    _address = "";
    _note = "No notes added";
    _showError = false;
    // Don't notify listeners here if called in dispose
  }
}