import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../global_provider.dart';

class DoctorProfileProvider extends ChangeNotifier{

  final languageP = GlobalProviderAccess.languagePro;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _doctorName = "";
  String _doctorPhone = "";
  String _doctorCountry = "";
  String _imageUrl = "";
  File? _image;
  bool _isDataFetched = true;

  String get doctorName => _doctorName;
  String get doctorPhone => _doctorPhone;
  String get doctorCountry => _doctorCountry;
  String get imageUrl => _imageUrl;
  File? get image => _image;

  Future<void> getSelfInfo() async {
    languageP?.loadSavedLanguage();
    if(_isDataFetched){
      await fireStore.collection("users").doc(auth.currentUser!.uid).get()
          .then((value) {
        _doctorName = value.get("name");
        _doctorPhone = value.get("phoneNumber");
        _doctorCountry = value.get("country");
        _imageUrl = value.get("profileUrl");
        nameC.text = _doctorName;
        _isDataFetched = false;
        notifyListeners();
      },);
      log(_doctorName);
      log(_doctorPhone);
      log(_imageUrl);
    }
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