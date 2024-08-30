import 'package:flutter/material.dart';

class DoctorHomeProvider extends ChangeNotifier {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  DateTime? get selectedStartDate => _selectedStartDate;
  DateTime? get selectedEndDate => _selectedEndDate;

  void selectDateRange(DateTime start, DateTime end) {
    _selectedStartDate = start;
    _selectedEndDate = end;
    notifyListeners();
  }

  void clearRange() {
    _selectedStartDate = null;
    _selectedEndDate = null;
    notifyListeners();
  }
}
