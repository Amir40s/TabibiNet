import 'dart:developer';

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/data/appointment_model.dart';

class DoctorAppointmentProvider extends ChangeNotifier{

  int _selectedIndex = 0;
  String _selectedAppointmentStatus = "All";

  int get selectedIndex => _selectedIndex;
  String get selectedAppointmentStatus => _selectedAppointmentStatus;

  void selectButton(int index,String status) {
    _selectedIndex = index;
    _selectedAppointmentStatus = status;
    log(_selectedAppointmentStatus);
    notifyListeners();
  }

  Stream<List<AppointmentModel>> fetchPatients() {
    return fireStore.collection('appointment')
        .where("doctorId",isEqualTo: auth.currentUser!.uid)
        .where("status",isEqualTo: _selectedAppointmentStatus)
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => AppointmentModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  Stream<List<AppointmentModel>> fetchPatientsSingle() {
    log("Doctor id is:: ${auth.currentUser!.uid}");
    return fireStore.collection('appointment')
        .where("doctorId",isEqualTo: auth.currentUser!.uid)
        .where("status",isEqualTo: "upcoming")
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => AppointmentModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  Stream<List<AppointmentModel>> fetchAllPatients() {
    return fireStore
        .collection('appointment')
        .where("doctorId", isEqualTo: auth.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      // Filter locally on 'status' to exclude 'Requesting'
      return snapshot.docs
          .where((doc) => doc['status'] != 'Requesting')
          .map((doc) => AppointmentModel.fromDocumentSnapshot(doc))
          .toList();
    });
  }


}