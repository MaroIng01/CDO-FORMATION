import 'package:cdo_test1/providers/app_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppProvider', () {
    test('Initial selected index should be 0', () {
      // ARRANGE
      final appProvider = AppProvider();
      // ACT & ASSERT
      expect(appProvider.selectedIndex, 0);
    });

    test('setSelectedIndex should update the index and notify listeners', () {
      // ARRANGE
      final appProvider = AppProvider();
      bool listenerCalled = false;
      appProvider.addListener(() {
        listenerCalled = true;
      });

      // ACT
      appProvider.setSelectedIndex(1);

      // ASSERT
      expect(appProvider.selectedIndex, 1);
      expect(listenerCalled, isTrue);
    });

    test('setSelectedIndex with the same value should not notify listeners', () {
      // ARRANGE
      final appProvider = AppProvider();
       // Définir une valeur initiale
      appProvider.setSelectedIndex(1);

      bool listenerCalled = false;
      appProvider.addListener(() {
        listenerCalled = true;
      });

      // ACT
      // Appeler avec la même valeur
      appProvider.setSelectedIndex(1);

      // ASSERT
      expect(listenerCalled, isFalse);
    });
  });
}