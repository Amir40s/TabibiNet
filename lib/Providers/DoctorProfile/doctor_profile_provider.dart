import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';

class DoctorProfileProvider extends ChangeNotifier{

  final TextEditingController nameC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _doctorName = "";
  String _doctorPhone = "";
  String _doctorCountry = "";
  File? _image;

  String get doctorName => _doctorName;
  String get doctorPhone => _doctorPhone;
  String get doctorCountry => _doctorCountry;
  File? get image => _image;

  Future<void> getSelfInfo() async {
    await fireStore.collection("users").doc(auth.currentUser!.uid).get()
        .then((value) {
      _doctorName = value.get("name");
      _doctorPhone = value.get("phoneNumber");
      _doctorCountry = value.get("country");
      nameC.text = _doctorName;
      notifyListeners();
    },);
    log(_doctorName);
    log(_doctorPhone);
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      Get.back();
      notifyListeners();
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      Get.back();
      notifyListeners();
    }
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }

}


//FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowedExtensions: ['png',],
//     );
//
//     if (result != null) {
//       // Handle the file selection here
//       // Example: Access the file using result.files.first
//       print('File selected: ${result.files.first.name}');
//     } else {
//       // User canceled the picker
//       print('File selection canceled');
//     }