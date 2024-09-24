import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/data/appointment_model.dart';

class MyAppointmentProvider extends ChangeNotifier{

  Stream<List<AppointmentModel>> fetchMyAppointment(status) {
    return fireStore.collection('appointment')
        .where("patientId",isEqualTo: auth.currentUser!.uid)
        .where("status",isEqualTo: status)
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => AppointmentModel.fromDocumentSnapshot(doc)).toList();
    });
  }

}