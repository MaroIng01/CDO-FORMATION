import 'package:flutter/material.dart';
import '../pages/accueil_page.dart';
import '../pages/services_page.dart';
import '../pages/more_page.dart';  // Ta page "More"

import '../widgets/bottom_nav_bar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      AccueilPage(
        onNavigateToServices: () {
          setState(() {
            _selectedIndex = 1; // Navigue vers la page Services
          });
        },
      ),
      const ServicesPage(),
      const MorePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
