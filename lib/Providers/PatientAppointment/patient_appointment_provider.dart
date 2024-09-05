import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PatientAppointmentProvider with ChangeNotifier {

  final List<String> _time = [
    "01.00 AM", "02.00 AM", "03.00 AM", "04.00 AM", "05.00 AM", "06.00 AM",
    "07.00 AM", "08.00 AM", "09.00 AM", "10.00 AM", "11.00 AM", "12.00 AM",
    "01.00 PM", "02.00 PM", "03.00 PM", "04.00 PM", "05.00 PM", "06.00 PM",
    "07.00 PM", "08.00 PM", "09.00 PM", "10.00 PM", "11.00 PM", "12.00 PM",
  ];

  String? _fromTime;
  String? _toTime;
  String? _appointmentTime;
  int? _selectFee;
  List<String> _filteredTime = [];

  PatientAppointmentProvider() {
    _filteredTime = List.from(_time); // Initially show all times
  }

  List<String> get time => _time;
  List<String> get filteredTime => _filteredTime;
  String? get fromTime => _fromTime;
  String? get toTime => _toTime;
  String? get appointmentTime => _appointmentTime;
  int? get selectFee => _selectFee;


  void setSelectedFee(index){
    _selectFee = index;
    notifyListeners();
  }

  void setAppointmentTime(appointmentTime){
    _appointmentTime = appointmentTime;
    log(_appointmentTime.toString());
    notifyListeners();
  }

  void setFromTime(String? value) {
    _fromTime = value;
    _filterTimes();
  }

  void setToTime(String? value) {
    _toTime = value;
    _filterTimes();
  }

  void _filterTimes() {
    if (_fromTime != null && _toTime != null) {
      int fromIndex = _time.indexOf(_fromTime!);
      int toIndex = _time.indexOf(_toTime!);

      if (fromIndex <= toIndex) {
        _filteredTime = _time.sublist(fromIndex, toIndex + 1);
      }
      notifyListeners();
    }
  }
}