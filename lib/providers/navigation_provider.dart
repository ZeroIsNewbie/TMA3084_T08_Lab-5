import 'package:flutter/foundation.dart';

/// Page positions used by the app shell, the bottom bar and the drawer.
///
/// Keeping them in one place avoids "magic numbers" such as 3 and 4.
abstract final class NavigationIndex {
  static const int home = 0;
  static const int students = 1;
  static const int records = 2;
  static const int category = 3;
  static const int about = 4;

  /// Total number of pages the shell can display.
  static const int pageCount = 5;

  /// Number of pages reachable from the bottom navigation bar.
  static const int bottomBarCount = 3;
}

/// Holds the selected navigation index so that it is shared between the
/// BottomNavigationBar and the Drawer instead of living in a StatefulWidget.
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = NavigationIndex.home;

  int get currentIndex => _currentIndex;

  /// Selects the page at [index] and notifies listeners.
  ///
  /// Does nothing if [index] is already selected (avoids a pointless rebuild)
  /// or is outside the range of known pages.
  void changeIndex(int index) {
    if (index == _currentIndex) return;
    if (index < 0 || index >= NavigationIndex.pageCount) return;

    _currentIndex = index;
    notifyListeners();// notify listeners when the selected page changes.
  }
}
