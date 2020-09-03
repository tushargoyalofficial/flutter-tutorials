import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TabberProvider with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  // FN called on press of tab button on bottom
  void onTabPress(int indx, GlobalKey<NavigatorState> navigatorKey) {
    if (_tabIndex != indx) {
      _tabIndex = indx; // update tab index value
      // handle routes based on tab button pressed in bottom tabnav
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
