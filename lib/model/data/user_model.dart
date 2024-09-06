import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userUid;
  final String name;
  final String email;
  final String userType;
  final String phoneNumber;
  final String country;
  final String speciality;
  final String availabilityFrom;
  final String availabilityTo;
  final String specialityDetail;
  final String appointmentFee;
  final String experience;
  final String patients;
  final String reviews;

  UserModel({
    required this.userUid,
    required this.name,
    required this.email,
    required this.userType,
    required this.phoneNumber,
    required this.country,
    required this.speciality,
    required this.availabilityFrom,
    required this.availabilityTo,
    required this.specialityDetail,
    required this.appointmentFee,
    required this.experience,
    required this.patients,
    required this.reviews,
  });

  // Factory method to create a UserModel from FireStore data
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userUid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      userType: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      country: data['country'] ?? '',
      speciality: data['speciality'] ?? '',
      availabilityFrom: data['availabilityFrom'] ?? '',
      availabilityTo: data['availabilityTo'] ?? '',
      specialityDetail: data['specialityDetail'] ?? '',
      appointmentFee: data['appointmentFee'] ?? '',
      experience: data['experience'] ?? '',
      patients: data['patients'] ?? '',
      reviews: data['reviews'] ?? '',
    );
  }
}

