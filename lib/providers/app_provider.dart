import 'package:flutter/foundation.dart';

/// AppProvider gère l'état global de l'application, comme l'index de navigation.
/// Il utilise ChangeNotifier pour notifier les widgets des changements.
class AppProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  /// L'index actuel de l'onglet de navigation sélectionné.
  int get selectedIndex => _selectedIndex;

  /// Modifie l'index de navigation sélectionné et notifie les auditeurs.
  void setSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners(); // Informe les widgets qui écoutent que l'état a changé.
    }
  }
}