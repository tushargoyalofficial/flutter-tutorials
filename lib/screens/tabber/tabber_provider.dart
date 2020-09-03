import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TabberProvider with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void onTabPress(int indx, GlobalKey<NavigatorState> navigatorKey) {
    if (_tabIndex != indx) {
      _tabIndex = indx;
      switch (indx) {
        case 0:
          navigatorKey.currentState.pushReplacementNamed('/');
          break;

        case 1:
          navigatorKey.currentState.pushReplacementNamed('/search');
          break;

        case 2:
          navigatorKey.currentState.pushReplacementNamed('/favs');
          break;

        case 3:
          navigatorKey.currentState.pushReplacementNamed('/profile');
          break;

        default:
          navigatorKey.currentState.pushReplacementNamed('/');
      }
      notifyListeners();
    }
  }
}
