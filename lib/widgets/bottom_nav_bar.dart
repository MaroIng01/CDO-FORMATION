// lib/widgets/bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // On utilise les couleurs du thème global défini dans main.dart
    final theme = Theme.of(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed, // Recommandé pour 3+ items
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.graduationCap),
          label: 'Formations',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bars),
          label: 'Plus', // "More" traduit en "Plus"
        ),
      ],
      // Ces propriétés sont maintenant gérées par le thème dans main.dart
      // selectedItemColor: theme.primaryColor,
      // unselectedItemColor: Colors.grey,
    );
  }
}