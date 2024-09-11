import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tabibinet_project/constant.dart';

import '../../model/data/user_model.dart';

class FavoritesProvider with ChangeNotifier {

  List<String> favoriteDoctors = [];

  // Fetch favorite doctors for the current patient
  Future<void> fetchFavoriteDoctors() async {
    final snapshot = await fireStore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      favoriteDoctors = List<String>.from(snapshot.data()?['favorites'] ?? []);
    }
    log("****************DataFetch************");
    notifyListeners();
  }

  Stream<List<String>> favoriteDoctorsStream() {
    return fireStore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return List<String>.from(snapshot.data()?['favorites'] ?? []);
      } else {
        return [];
      }
    });
  }

  // Fetch doctor details based on favorite doctor IDs
  Stream<List<UserModel>> favoriteDoctorDetailsStream() {
    return favoriteDoctorsStream().asyncMap((favoriteDoctorIds) async {
      List<UserModel> doctorDetails = [];

      for (var doctorId in favoriteDoctorIds) {
        final doctorSnapshot = await fireStore.collection('users').doc(doctorId).get();
        if (doctorSnapshot.exists) {
          doctorDetails.add(UserModel.fromDocumentSnapshot(doctorSnapshot));
        }
      }

      return doctorDetails;
    });
  }

  // Add doctor to favorites
  Future<void> addFavoriteDoctor(String doctorId) async {
    if (!favoriteDoctors.contains(doctorId)) {
      favoriteDoctors.add(doctorId);
      await fireStore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set({'favorites': favoriteDoctors}, SetOptions(merge: true));
      notifyListeners();
    }
  }

  // Remove doctor from favorites
  Future<void> removeFavoriteDoctor(String doctorId) async {
    if (favoriteDoctors.contains(doctorId)) {
      favoriteDoctors.remove(doctorId);
      await fireStore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set({'favorites': favoriteDoctors}, SetOptions(merge: true));
      notifyListeners();
    }
  }

  // Toggle favorite status
  Future<void> toggleFavorite(String doctorId) async {
    if (favoriteDoctors.contains(doctorId)) {
      await removeFavoriteDoctor(doctorId);
    } else {
      await addFavoriteDoctor(doctorId);
    }
  }

  bool isFavorite(String doctorId) {
    return favoriteDoctors.contains(doctorId);
  }

}
