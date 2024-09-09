import 'dart:developer';
import 'package:flutter/cupertino.dart';

class FindDoctorProvider extends ChangeNotifier{

  String? _selectDoctorCategory;
  int _selectedIndex = 0;
  int _numberOfDoctors = 0;

  int get selectedIndex => _selectedIndex;
  int get numberOfDoctors => _numberOfDoctors;
  String? get selectDoctorCategory => _selectDoctorCategory;

  void setDoctorCategory(int index,String category) {
    _selectedIndex = index;
    _selectDoctorCategory = category;
    log(category);
    notifyListeners();
  }

  void setNumberOfDoctors(int index) {
    _numberOfDoctors = index;
    log(index.toString());
    notifyListeners();
  }

}