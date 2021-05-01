import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  
  int _currentIndex = 0;

  int get currentIndex => this._currentIndex;

  set changeCurrentIndex(int i) {
    this._currentIndex = i;
    notifyListeners();
  }
}
