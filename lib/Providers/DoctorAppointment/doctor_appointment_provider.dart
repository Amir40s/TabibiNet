import 'package:flutter/material.dart';

class DoctorAppointmentProvider extends ChangeNotifier{

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectButton(int index) {
    _selectedIndex = index;
    // _isBouncing = true;
    // notifyListeners();
    // Future.delayed(Duration(milliseconds: 300), () {
    //   _isBouncing = false; });
    notifyListeners();
  }

}