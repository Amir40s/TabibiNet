import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabibinet_project/constant.dart';

class PatientProfileProvider extends ChangeNotifier{

  final TextEditingController nameC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _patientName = "";
  String _patientPhone = "";
  String _patientCountry = "";
  String _imageUrl = "";
  File? _image;
  bool _isDataFetched = true;

  String get patientName => _patientName;
  String get patientPhone => _patientPhone;
  String get patientCountry => _patientCountry;
  String get imageUrl => _imageUrl;
  File? get image => _image;

  Future<void> getSelfInfo() async {
    if(_isDataFetched){
      await fireStore.collection("users").doc(auth.currentUser!.uid).get()
          .then((value) {
        _patientName = value.get("name");
        _patientPhone = value.get("phoneNumber");
        _patientCountry = value.get("country");
        _imageUrl = value.get("profileUrl");
        nameC.text = _patientName;
        _isDataFetched = false;
        notifyListeners();
      },);
      log(_patientName);
      log(_patientPhone);
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