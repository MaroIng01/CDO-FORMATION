import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/accueil_page.dart';    
import 'pages/services_page.dart';   

// Pour gérer la taille de la fenêtre en desktop
import 'dart:io';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ====== DÉBUT DU CODE POUR LA TAILLE DE FENÊTRE (Desktop) ======
if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  setWindowTitle('CDO App');
  setWindowMinSize(const Size(500, 896));  // taille min plus grande
  setWindowMaxSize(Size.infinite);         // possibilité de redimensionner après
  setWindowFrame(const Rect.fromLTWH(100, 100, 414, 896));  // position et taille initiale plus grande
}
// ====== FIN DU CODE POUR LA TAILLE DE FENÊTRE (Desktop) ======


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
