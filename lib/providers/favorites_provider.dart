import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../services/storage_service.dart';
import '../repositories/coffee_repository.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteIds = [];

  // dynamically finds the Coffee objects that match your saved IDs
  List<Coffee> get favorites {
    final allCoffees = CoffeeRepository().getCoffees();
    return allCoffees
        .where((coffee) => _favoriteIds.contains(coffee.name))
        .toList();
  }

  FavoritesProvider() {
    _loadFavorites();
  }

  void _loadFavorites() {
    final List<String>? storedFavorites = StorageService().getStringList('favorite_coffees');
    if (storedFavorites != null) {
      _favoriteIds = storedFavorites;
      notifyListeners();
    }
  }

  void _saveFavorites() {
    StorageService().setStringList('favorite_coffees', _favoriteIds);
  }

  void toggleFavorite(Coffee coffee) {
    if (_favoriteIds.contains(coffee.name)) {
      _favoriteIds.remove(coffee.name);
    } else {
      _favoriteIds.add(coffee.name);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Coffee coffee) {
    return _favoriteIds.contains(coffee.name);
  }
}