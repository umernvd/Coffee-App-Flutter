import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/cart_provider.dart';
import 'providers/order_provider.dart';
import 'screens/onboarding_screen.dart';
import 'services/storage_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Required for async main
  await StorageService().init(); // Initialize Storage Service
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Using our new centralized theme
      home: const OnboardingScreen(),
    );
  }
}