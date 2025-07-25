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

  static const Color selectedColor = Color(0xFFbb2d3b); // Rouge
  static const Color unselectedColor = Color(0xFF4c6c7b); // Bleu-gris

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: null, // Important: null pour laisser FaIcon gérer la couleur
      unselectedItemColor: null, // Important aussi
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.house,
            color: currentIndex == 0 ? selectedColor : unselectedColor,
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.graduationCap,
            color: currentIndex == 1 ? selectedColor : unselectedColor,
          ),
          label: 'Formations',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: currentIndex == 2 ? selectedColor : unselectedColor,
          ),
          label: 'More',
        ),
      ],
    );
  }
}
