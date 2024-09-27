import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../global_provider.dart';
import '../../model/res/widgets/toast_msg.dart';
import '../../model/services/CloudinaryServices/cloudinary_services.dart';

class ProfileProvider extends ChangeNotifier{

  final languageP = GlobalProviderAccess.languagePro;
  final CloudinaryService _cloudinaryService = CloudinaryService();

  final TextEditingController nameC = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _name = "";
  String _email = "";
  String _userType = "";
  String _phoneNumber = "";
  String _country = "";
  String _birthDate = "";
  String _speciality = "";
  String _specialityId = "";
  String _availabilityFrom = "";
  String _availabilityTo = "";
  String _specialityDetail = "";
  String _appointmentFee = "";
  String _memberShip = "";
  String _experience = "";
  String _patients = "";
  String _reviews = "";
  String _profileUrl = "";
  String _rating = "";
  String _isOnline = "";
  String _location = "";
  String _latitude = "";
  String _longitude = "";
  String _accountType = "";
  File? _image;
  bool _isDataFetched = true;
  bool _isLoading = false;

  String get name => _name;
  String get email => _email;
  String get userType => _userType;
  String get phoneNumber => _phoneNumber;
  String get country => _country;
  String get birthDate => _birthDate;
  String get speciality => _speciality;
  String get specialityId => _specialityId;
  String get availabilityFrom => _availabilityFrom;
  String get availabilityTo => _availabilityTo;
  String get specialityDetail => _specialityDetail;
  String get appointmentFee => _appointmentFee;
  String get memberShip => _memberShip;
  String get experience => _experience;
  String get patients => _patients;
  String get reviews => _reviews;
  String get profileUrl => _profileUrl;
  String get rating => _rating;
  String get isOnline => _isOnline;
  String get location => _location;
  String get latitude => _latitude;
  String get longitude => _longitude;
  String get accountType => _accountType;
  bool get isLoading => _isLoading;
  File? get image => _image;
  bool get isDataFetched => _isDataFetched;

  Future<void> getSelfInfo() async {
    languageP?.loadSavedLanguage();
    if(_isDataFetched){
      await fireStore.collection("users").doc(auth.currentUser!.uid).get()
          .then((value) {
        _name = value.get("name");
        _phoneNumber = value.get("phoneNumber");
        _country = value.get("country");
        _birthDate = value.get("birthDate");
        _email = value.get("email");
        _profileUrl = value.get("profileUrl");
        nameC.text = _name;
        _isDataFetched = false;
        notifyListeners();
      },);
      log(_name);
      log(_phoneNumber);
      log(_email);
      log(_profileUrl);
    }
  }

  Future<void> updateProfileWithImage()async{
    _isLoading = true;
    notifyListeners();

    uploadFile().whenComplete(() {
      fireStore.collection("users").doc(auth.currentUser!.uid).update({
        "name" : nameC.text,
        "birthDate" : _birthDate,
        "profileUrl" : _profileUrl,
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
        _profileUrl = url;
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
      "birthDate" : _birthDate,
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
    _birthDate = format;
    notifyListeners(); // Notify listeners when the date is updated
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }

}