// lib/main.dart

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
    setWindowMinSize(const Size(500, 896));  
    setWindowMaxSize(Size.infinite);         
    setWindowFrame(const Rect.fromLTWH(100, 100, 414, 896));
  }
  // ====== FIN DU CODE POUR LA TAILLE DE FENÊTRE (Desktop) ======

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MODERN THEME DEFINITION
    const primaryColor = Color(0xFFA40022);
    const textColor = Color(0xFF2E2E2E);
    const backgroundColor = Color(0xFFF8F9FA);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CDO App',
      theme: ThemeData(
        // General theme settings
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        
        // Text theme for consistency
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 32),
          headlineMedium: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
          bodyLarge: TextStyle(color: textColor, fontSize: 16, height: 1.5),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 14, height: 1.5),
        ),

        // AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent for a modern look
          elevation: 0,
          foregroundColor: textColor,
          iconTheme: IconThemeData(color: textColor),
          titleTextStyle: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),

        // Card theme
        cardTheme: CardThemeData(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.08),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // ElevatedButton theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 5,
            shadowColor: primaryColor.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        
        // BottomNavigationBar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
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