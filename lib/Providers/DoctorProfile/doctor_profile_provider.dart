import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tabibinet_project/model/res/widgets/toast_msg.dart';

import '../../constant.dart';
import '../../global_provider.dart';
import '../../model/services/CloudinaryServices/cloudinary_services.dart';

class DoctorProfileProvider extends ChangeNotifier{

  final languageP = GlobalProviderAccess.languagePro;
  final CloudinaryService _cloudinaryService = CloudinaryService();

  final TextEditingController nameC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _doctorName = "";
  String _doctorPhone = "";
  String _doctorCountry = "";
  String _doctorDOB = "";
  String _imageUrl = "";
  File? _image;
  bool _isDataFetched = true;
  bool _isLoading = false;

  String get doctorName => _doctorName;
  String get doctorPhone => _doctorPhone;
  String get doctorCountry => _doctorCountry;
  String get doctorDOB => _doctorDOB;
  String get imageUrl => _imageUrl;
  File? get image => _image;
  bool get isLoading => _isLoading;

  Future<void> getSelfInfo() async {
    languageP?.loadSavedLanguage();
    if(_isDataFetched){
      await fireStore.collection("users").doc(auth.currentUser!.uid).get()
          .then((value) {
        _doctorName = value.get("name");
        _doctorPhone = value.get("phoneNumber");
        _doctorCountry = value.get("country");
        _doctorDOB = value.get("birthDate");
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

  Future<void> updateProfileWithImage()async{
    _isLoading = true;
    notifyListeners();

    uploadFile().whenComplete(() {
      fireStore.collection("users").doc(auth.currentUser!.uid).update({
        "name" : nameC.text,
        "birthDate" : _doctorDOB,
        "profileUrl" : _imageUrl,
      })
          .whenComplete(() {
        _isLoading = false;
        ToastMsg().toastMsg("Profile Update Successfully!");
        notifyListeners();
      },);
    },);

  }

  Future<void> updateProfile()async{
    _isLoading = true;
    notifyListeners();
    await fireStore.collection("users").doc(auth.currentUser!.uid).update({
      "name" : nameC.text,
      "birthDate" : _doctorDOB,
    })
        .whenComplete(() {
          _isLoading = false;
          ToastMsg().toastMsg("Profile Update Successfully!");
          notifyListeners();
    },);
  }

  Future<void> uploadFile() async {
    _isLoading = true;
    notifyListeners();

    try {
      String? url = await _cloudinaryService.uploadFile(_image!);
      if (url != null) {
        _imageUrl = url;
        log("message:: $url");
        notifyListeners();
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
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

  void setDate(DateTime date) {
    String format = DateFormat('yyyy-MM-dd').format(date);
    _doctorDOB = format;
    notifyListeners(); // Notify listeners when the date is updated
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