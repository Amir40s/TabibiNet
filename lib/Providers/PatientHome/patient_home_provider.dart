import 'dart:developer';

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/data/user_model.dart';


class PatientHomeProvider extends ChangeNotifier{

  int? _currentOption;
  int? _currentExperience;
  int? _currentRating;
  int? _currentTime;
  int? _selectSpeciality;
  int? _selectCancelReason;
  int _currentIndex = 0;
  bool _isFilter = false;
  DateTime _selectedDate = DateTime.now();
  String? _review;
  String? _selectedAppointmentType;

  int get currentIndex => _currentIndex;
  int? get currentOption => _currentOption;
  int? get currentExperience => _currentExperience;
  int? get currentRating => _currentRating;
  int? get currentTime => _currentTime;
  int? get selectSpeciality => _selectSpeciality;
  int? get selectCancelReason => _selectCancelReason;
  DateTime get selectedDate => _selectedDate;
  bool get isFilter => _isFilter;
  String? get review => _review;
  String? get selectedAppointmentType => _selectedAppointmentType;

  void selectReview(String review) {
    _review = review;
    notifyListeners();
  }

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

  void selectTime(int index) {
    _currentTime = index;
    notifyListeners();
  }

  void setSpeciality(int index) {
    _selectSpeciality = index;
    notifyListeners();
  }

  void setAppointmentType(String index) {
    _selectedAppointmentType = index;
    notifyListeners();
  }

  void setCancelReason(int index) {
    _selectCancelReason = index;
    notifyListeners();
  }

  // Stream to fetch users from FireStore
  Stream<List<UserModel>> fetchDoctors() {
    return fireStore.collection('users')
        .where( "userType", isEqualTo: "Health Professional")
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  Stream<List<UserModel>> fetchFilterDoctors(String doctorCat) {
    return fireStore
        .collection('users')
        .where("userType", isEqualTo: "Health Professional")
        .where("speciality", isEqualTo: doctorCat) // Example of another filter
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromDocumentSnapshot(doc)).toList();
    });
  }

}

// **************** Calender Provider Class ****************

class DateProvider extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    log(date.toString());
    notifyListeners();
  }
}
