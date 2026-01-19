import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Singleton Pattern
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  // Initialize this in main.dart before the app starts
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save a String (Used for Address, Notes, and JSON Data)
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Get a String
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Save a List of Strings (Used for Favorites)
  Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // Get a List of Strings
  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }
}