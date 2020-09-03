import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TabberProvider with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void onTabPress(int indx) {
    if (_tabIndex != indx) {
      _tabIndex = indx;
      notifyListeners();
    }
  }
}
