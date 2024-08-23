import 'package:flutter/material.dart';

class PatientHomeProvider extends ChangeNotifier{

  int _selectedIndex = 0;
  int? _currentOption;
  int? _currentExperience;
  int? _currentRating;
  int _currentIndex = 0;
  bool _isFilter = false;
  DateTime _selectedDate = DateTime.now();

  int get currentIndex => _currentIndex;
  int get selectedIndex => _selectedIndex;
  int? get currentOption => _currentOption;
  int? get currentExperience => _currentExperience;
  int? get currentRating => _currentRating;
  DateTime get selectedDate => _selectedDate;
  bool get isFilter => _isFilter;

  setFilter(bool filter){
    _isFilter = filter;
    notifyListeners();
  }

  setIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  setOption(int index){
    _currentOption = index;
    notifyListeners();
  }

  setExperience(int index){
    _currentExperience = index;
    notifyListeners();
  }

  setRating(int index){
    _currentRating = index;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectButton(int index) {
    _selectedIndex = index;
    // _isBouncing = true;
    // notifyListeners();
    // Future.delayed(Duration(milliseconds: 300), () {
    //   _isBouncing = false; });
      notifyListeners();
  }

}