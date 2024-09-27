import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier{

  int _selectDay = 0;
  int _selectRepeat = 0;
  int _selectTaken = 0;
  String _timeOfDay = "";
  String _repetition = "";
  String _taken = "";

  int get selectDay => _selectDay;
  int get selectRepeat => _selectRepeat;
  int get selectTaken => _selectTaken;
  String get timeOfDay => _timeOfDay;
  String get repetition => _repetition;
  String get taken => _taken;

  void selectDayButton(int index,timeOfDay) {
    _selectDay = index;
    _timeOfDay = timeOfDay;
    notifyListeners();
  }

  void selectRepeatButton(int index,repetition) {
    _selectRepeat = index;
    _repetition = repetition;
    notifyListeners();
  }

  void selectTakenButton(int index,taken) {
    _selectTaken = index;
    _taken = taken;
    notifyListeners();
  }

}