import 'dart:developer';
import 'package:flutter/cupertino.dart';

import '../../constant.dart';
import '../../model/data/specialize_model.dart';
import '../../model/data/user_model.dart';

class FindDoctorProvider extends ChangeNotifier{

  String? _selectSpecialityId;
  int? _selectedIndex;
  int _numberOfDoctors = 0;

  int? get selectedIndex => _selectedIndex;
  int get numberOfDoctors => _numberOfDoctors;
  String? get selectDoctorCategory => _selectSpecialityId;

  void setDoctorCategory(int index,String category) {
    _selectedIndex = index;
    _selectSpecialityId = category;
    log(category);
    notifyListeners();
  }

  Stream<List<SpecializeModel>> fetchSpeciality() {
    return fireStore.collection('doctorsSpecialty')
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => SpecializeModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  Stream<List<UserModel>> fetchFilterDoctors(String doctorCat) {
    return fireStore
        .collection('users')
        .where("userType", isEqualTo: "Health Professional")
        .where("specialityId", isEqualTo: doctorCat) // Example of another filter
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromDocumentSnapshot(doc)).toList();
    });
  }


  void setNumberOfDoctors(int index) {
    _numberOfDoctors = index;
    log(index.toString());
    notifyListeners();
  }

}