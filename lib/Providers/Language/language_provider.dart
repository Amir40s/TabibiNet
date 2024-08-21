import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{

  int _selectedIndex = 0; // Default selection
  bool _isBouncing = false;

  int get selectedIndex => _selectedIndex;
  bool get isBouncing => _isBouncing;

  void selectButton(int index) {
    _selectedIndex = index;
    _isBouncing = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 300), () {
      _isBouncing = false;
      notifyListeners();
    });
  }

}