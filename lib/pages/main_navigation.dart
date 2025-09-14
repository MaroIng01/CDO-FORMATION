// lib/pages/main_navigation.dart

import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'accueil_page.dart';
import 'services_page.dart';
import 'more_page.dart';

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
    _pages = <Widget>[
      AccueilPage(
        onNavigateToServices: () {
          setState(() {
            _selectedIndex = 1;
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex),
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        // Ces noms correspondent maintenant parfaitement à la définition
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}