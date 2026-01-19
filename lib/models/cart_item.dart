import 'coffee_model.dart';

class CartItem {
  final Coffee coffee;
  int quantity;

  CartItem({required this.coffee, this.quantity = 1});

  // Helper to get total price of this specific item line
  double get totalPrice => (double.tryParse(coffee.price) ?? 0.0) * quantity;

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'coffee': coffee.toJson(),
      'quantity': quantity,
    };
  }

  // Create from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      coffee: Coffee.fromJson(json['coffee']),
      quantity: json['quantity'],
    );
  }
}