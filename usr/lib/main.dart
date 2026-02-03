import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/drink_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const BebidasSaludablesApp());
}

class BebidasSaludablesApp extends StatelessWidget {
  const BebidasSaludablesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bebidas Saludables',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/drink-detail') {
          final drink = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DrinkDetailScreen(drink: drink),
          );
        }
        return null;
      },
    );
  }
}
