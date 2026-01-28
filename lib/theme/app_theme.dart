import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFFC67C4E);
  static const Color backgroundColor = Color(0xFFF9F9F9);
  static const Color textPrimary = Color(0xFF242424);
  static const Color textSecondary = Color(0xFFA2A2A2);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    fontFamily: 'Sora',
    
    // Default Text Styles
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: textPrimary),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary),
      bodyLarge: TextStyle(fontSize: 14, color: textPrimary),
      bodyMedium: TextStyle(fontSize: 12, color: textSecondary),
    ),

    // Button Styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Sora'),
      ),
    ),

    // Icon Styles
    iconTheme: const IconThemeData(color: Color(0xFF000000)),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: white,
      elevation: 10,
      selectedItemColor: primaryColor,      
      unselectedItemColor: Color(0xFF000000),   
      showSelectedLabels: false,            
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );
}