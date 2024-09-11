import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  final String id;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final String patientProblem;
  final String patientGender;
  final String patientAge;
  final String appointmentTime;
  final String appointmentDate;
  final String doctorId;
  final String image;
  final String name;
  final String phone;
  final String status;


  PatientModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.patientProblem,
    required this.patientGender,
    required this.patientAge,
    required this.appointmentTime,
    required this.appointmentDate,
    required this.image,
    required this.name,
    required this.phone,
    required this.status,
  });

  // Factory method to create a UserModel from FireStore data
  factory PatientModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PatientModel(
      id: doc.id,
      patientId: data['patientId'] ?? '',
      patientName: data['patientName'] ?? '',
      patientPhone: data['patientPhone'] ?? '',
      patientProblem: data['patientProblem'] ?? '',
      patientGender: data['patientGender'] ?? '',
      patientAge: data['patientAge'] ?? '',
      appointmentTime: data['appointmentTime'] ?? '',
      appointmentDate: data['appointmentDate'] ?? '',
      doctorId: data['doctorId'] ?? '',
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      status: data['status'] ?? '',
    );
  }
}