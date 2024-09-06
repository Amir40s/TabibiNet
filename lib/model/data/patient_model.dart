import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  final String patientId;
  final String patientName;
  final String patientPhone;
  final String patientProblem;
  final String patientGender;
  final String patientAge;
  final String appointmentTime;
  final String appointmentDate;

  PatientModel({
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.patientProblem,
    required this.patientGender,
    required this.patientAge,
    required this.appointmentTime,
    required this.appointmentDate,
  });

  // Factory method to create a UserModel from FireStore data
  factory PatientModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PatientModel(
      patientId: doc.id,
      patientName: data['patientName'] ?? '',
      patientPhone: data['patientPhone'] ?? '',
      patientProblem: data['patientProblem'] ?? '',
      patientGender: data['patientGender'] ?? '',
      patientAge: data['patientAge'] ?? '',
      appointmentTime: data['appointmentTime'] ?? '',
      appointmentDate: data['appointmentDate'] ?? '',
    );
  }
}