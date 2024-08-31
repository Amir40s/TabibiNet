import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier{

  int _selectDay = 0;
  int _selectRepeat = 0;
  int _selectTaken = 0;

  int get selectDay => _selectDay;
  int get selectRepeat => _selectRepeat;
  int get selectTaken => _selectTaken;

  void selectDayButton(int index) {
    _selectDay = index;
    notifyListeners();
  }

  void selectRepeatButton(int index) {
    _selectRepeat = index;
    notifyListeners();
  }

  void selectTakenButton(int index) {
    _selectTaken = index;
    notifyListeners();
  }

}