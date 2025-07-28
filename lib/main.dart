import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/accueil_page.dart';    // Assure-toi que ce chemin est correct
import 'pages/services_page.dart';   // Pareil ici

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CDO App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFbb2d3b),
          unselectedItemColor: Color.fromARGB(255, 121, 136, 144),
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Color(0xFFbb2d3b)),
          unselectedIconTheme: IconThemeData(color: Color.fromARGB(255, 121, 136, 144)),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/accueil': (context) => const AccueilPage(),
        '/services': (context) => const ServicesPage(),
      },
    );
  }
}
