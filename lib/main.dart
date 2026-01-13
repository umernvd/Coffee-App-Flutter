import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart'; // Import the new screen

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        // Setting the default scaffold color to black as per design theme
        scaffoldBackgroundColor: const Color(0xFF050505),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}