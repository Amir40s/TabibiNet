import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/global_provider.dart';
import 'package:tabibinet_project/model/data/fee_information_model.dart';
import 'package:tabibinet_project/model/data/patient_model.dart';

import '../../Screens/PatientScreens/StartAppointmentScreen/start_appointment_screen.dart';

class PatientAppointmentProvider with ChangeNotifier {

  PatientAppointmentProvider() {
    _filteredTime = List.from(_time); // Initially show all times
  }

  final profileP = GlobalProviderAccess.patientProfilePro;

  final nameC = TextEditingController();
  final phoneC = TextEditingController();
  final problemC = TextEditingController();

  final List<String> _time = [
    "01.00 AM", "02.00 AM", "03.00 AM", "04.00 AM", "05.00 AM", "06.00 AM",
    "07.00 AM", "08.00 AM", "09.00 AM", "10.00 AM", "11.00 AM", "12.00 AM",
    "01.00 PM", "02.00 PM", "03.00 PM", "04.00 PM", "05.00 PM", "06.00 PM",
    "07.00 PM", "08.00 PM", "09.00 PM", "10.00 PM", "11.00 PM", "12.00 PM",
  ];

  String? _doctorId;
  String? _fromTime;
  String? _toTime;
  String? _appointmentTime;
  String? _appointmentDate;
  int? _selectPatientAge;
  String? _selectedGender;
  String? _patientAge;
  //
  int? _selectFeeIndex;
  String _selectFeeType = "";
  String _selectFee = "";
  //
  List<String> _filteredTime = [];

  List<String> get time => _time;
  List<String> get filteredTime => _filteredTime;
  String? get doctorId => _doctorId;
  String? get fromTime => _fromTime;
  String? get toTime => _toTime;
  String? get appointmentTime => _appointmentTime;
  String? get appointmentDate => _appointmentDate;
  String? get selectedGender => _selectedGender;
  String? get patientAge => _patientAge;
  //Fee Variables
  String get selectFeeType => _selectFeeType;
  String get selectFee => _selectFee;
  int? get selectFeeIndex => _selectFeeIndex;
  //
  int? get selectPatientAge => _selectPatientAge;

  void selectGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setPatientAge(int index, String age) {
    _selectPatientAge = index;
    _patientAge = age;
    notifyListeners();
  }

  void setSelectedFee(index,feeType,feeAmount){
    _selectFeeIndex = index;
    _selectFeeType = feeType;
    _selectFee = feeAmount;
    log(_selectFeeIndex.toString());
    log(_selectFeeType);
    log(_selectFee);
    notifyListeners();
  }

  void setDoctorId(doctorId){
    _doctorId = doctorId;
    log(_doctorId.toString());
    notifyListeners();
  }

  void setAppointmentDate(DateTime date){
    // Format the time using intl
    String formattedDate = DateFormat('EEEE, MMMM d').format(date);
    _appointmentDate = formattedDate;
    log(_appointmentDate.toString());
    notifyListeners();
  }

  void setAppointmentTime(appointmentTime){
    _appointmentTime = appointmentTime;
    log(_appointmentTime.toString());
    notifyListeners();
  }

  void setAvailabilityTime(String? from, String? to) {
    _fromTime = from;
    _toTime = to;
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

  Stream<List<FeeInformationModel>> fetchFeeInfo() {
    return fireStore.collection('feeInformation')
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => FeeInformationModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  Future<void> addPatient() async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await fireStore.collection("appointment").doc(id).set({
      "id" : id,
      "patientId" : auth.currentUser!.uid,
      "doctorId" : _doctorId,
      "name": profileP!.patientName,
      "phone": profileP!.patientPhone,
      "image": profileP!.imageUrl,
      "status": "Requesting",
      "patientName" : nameC.text.toString(),
      "patientAge" : _patientAge,
      "patientPhone" : phoneC.text.toString(),
      "patientGender" : _selectedGender,
      "patientProblem" : problemC.text.toString(),
      "appointmentTime" : _appointmentTime,
      "appointmentDate" : _appointmentDate,
      "appointmentPayment" : _selectFee,
      "applyDate" : DateTime.now(),
    })
        .whenComplete(() {
      Get.off(()=>StartAppointmentScreen());
    },);
  }
  
}