import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../services/storage_service.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteIds = [];

  List<String> get favoriteIds => _favoriteIds;

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