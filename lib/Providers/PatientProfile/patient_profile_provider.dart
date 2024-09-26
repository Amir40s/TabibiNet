import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/global_provider.dart';

import '../../model/res/widgets/toast_msg.dart';
import '../../model/services/CloudinaryServices/cloudinary_services.dart';

class PatientProfileProvider extends ChangeNotifier{

  final languageP = GlobalProviderAccess.languagePro;
  final CloudinaryService _cloudinaryService = CloudinaryService();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _patientName = "";
  String _patientPhone = "";
  String _patientCountry = "";
  String _patientDOB = "";
  String _patientEmail = "";
  String _imageUrl = "";
  File? _image;
  bool _isDataFetched = true;
  bool _isLoading = false;

  String get patientName => _patientName;
  String get patientEmail => _patientEmail;
  String get patientPhone => _patientPhone;
  String get patientDOB => _patientDOB;
  String get patientCountry => _patientCountry;
  String get imageUrl => _imageUrl;
  bool get isLoading => _isLoading;
  File? get image => _image;

  Future<void> getSelfInfo() async {
    languageP?.loadSavedLanguage();
    if(_isDataFetched){
      await fireStore.collection("users").doc(auth.currentUser!.uid).get()
          .then((value) {
        _patientName = value.get("name");
        _patientPhone = value.get("phoneNumber");
        _patientCountry = value.get("country");
        _patientDOB = value.get("birthDate");
        _patientEmail = value.get("email");
        _imageUrl = value.get("profileUrl");
        nameC.text = _patientName;
        _isDataFetched = false;
        notifyListeners();
      },);
      log(_patientName);
      log(_patientPhone);
      log(_patientEmail);
      log(_imageUrl);
    }
  }

  Future<void> updateProfileWithImage()async{
    _isLoading = true;
    notifyListeners();

    uploadFile().whenComplete(() {
      fireStore.collection("users").doc(auth.currentUser!.uid).update({
        "name" : nameC.text,
        "birthDate" : _patientDOB,
        "profileUrl" : _imageUrl,
      })
          .whenComplete(() {
        _isLoading = false;
        ToastMsg().toastMsg("Profile Update Successfully!");
        notifyListeners();
      },);
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

  Future<void> updateProfile()async{
    _isLoading = true;
    notifyListeners();
    await fireStore.collection("users").doc(auth.currentUser!.uid).update({
      "name" : nameC.text,
      "birthDate" : _patientDOB,
    })
        .whenComplete(() {
      _isLoading = false;
      ToastMsg().toastMsg("Profile Update Successfully!");
      notifyListeners();
    },);
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
    _patientDOB = format;
    notifyListeners(); // Notify listeners when the date is updated
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }

}