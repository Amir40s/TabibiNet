import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorBottomNavBar/doctor_bottom_navbar.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientBottomNavBar/patient_bottom_nav_bar.dart';
import 'package:tabibinet_project/model/res/widgets/toast_msg.dart';
import '../../Screens/DoctorScreens/DoctorHomeScreen/Components/patient_detail_chart.dart';
import '../../constant.dart';
import '../../global_provider.dart';
import '../../model/services/FirebaseServices/auth_services.dart';
import '../../model/services/NotificationServices/flutter_local_notification.dart';

class SignUpProvider extends ChangeNotifier{

  final AuthServices authServices = AuthServices();
  final patientProfileProvider = GlobalProviderAccess.patientProfilePro;
  final doctorProfileProvider = GlobalProviderAccess.doctorProfilePro;
  final patientNotificationProvider = GlobalProviderAccess.patientNotificationPro;

  final String title = "Congratulations!";
  final String subTitle = "Your Account Created Successfully";
  final String type = "Account Registration";

  bool _isCheck = false;
  bool _isLoading = false;
  bool _isSignUpPasswordShow = true;
  bool _isSignUpConfirmPasswordShow = true;

  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  bool get isCheck => _isCheck;
  bool get isLoading => _isLoading;
  bool get isSignUpPasswordShow => _isSignUpPasswordShow;
  bool get isSignUpConfirmPasswordShow => _isSignUpConfirmPasswordShow;

  checkRememberPassword(bool isCheck){
    _isCheck = isCheck;
    notifyListeners();
  }

  showSignUpPassword(){
    _isSignUpPasswordShow = !_isSignUpPasswordShow;
    notifyListeners();
  }

  showSignUpConfirmPassword(){
    _isSignUpConfirmPasswordShow = !_isSignUpConfirmPasswordShow;
    notifyListeners();
  }

  Future<void> signUp(
      speciality, specialityDetail,
      yearsOfExperience, appointmentFrom,
      appointmentTo, appointmentFee,
      type, country,location,
      latitude,longitude
      ) async{
    _isLoading = true;
    notifyListeners();
    auth.createUserWithEmailAndPassword(
        email: emailC.text.toString(),
        password: passwordC.text.toString()
    )
        .then((value) async {
      String? userUID = auth.currentUser!.uid;
      await fireStore.collection("users").doc(userUID).set(
          {
            "creationDate": DateTime.now(),
            "userUid": userUID,
            "email": emailC.text.toString(),
            "name": nameC.text,
            "phoneNumber": phoneC.text,
            "country": country,
            "profileUrl": "https://res.cloudinary.com/dz0mfu819/image/upload/v1725947218/profile_xfxlfl.png",
            "rating": "0.0",
            "isOnline": "false",
            "location": location,
            "latitude": latitude,
            "longitude": longitude,
            "speciality": speciality,
            "specialityDetail": specialityDetail,
            "experience": yearsOfExperience,
            "availabilityFrom": appointmentFrom,
            "availabilityTo": appointmentTo,
            "appointmentFee": appointmentFee,
            "reviews": "0",
            "patients": "0",
            "userType": type,
            "accountType": "Custom",
          }
          )
          .whenComplete(() async {
            if (type == "Patient") {
              sendNotification();
              await patientNotificationProvider!.storeNotification(
                  title: title,
                  subTitle: subTitle,
                  type: type);
              await patientProfileProvider!.getSelfInfo()
            .whenComplete(() {
              Get.off(() => const PatientBottomNavBar());
              },);
              // Get.off(() => const PatientBottomNavBar());
            } else if (type == "Health Professional") {
              sendNotification();
              await patientNotificationProvider!.storeNotification(
                  title: title,
                  subTitle: subTitle,
                  type: type);
              doctorProfileProvider!.getSelfInfo()
                  .whenComplete(() {
                Get.off(() => const DoctorBottomNavbar());
              },);
              // Get.off(() => const DoctorBottomNavbar());
            }
            ToastMsg().toastMsg("Account Created Successfully");
            log("*********** Complete ************");
            _isLoading = false;
            notifyListeners();
            },)
          .onError((error, stackTrace) {
            ToastMsg().toastMsg(error.toString());
            log("*********** Error ************");
            _isLoading = false;
            log(error.toString());
            notifyListeners();
            },);
      },)
        .onError((error, stackTrace) {
          ToastMsg().toastMsg(error.toString());
          log("*********** Error ************");
          _isLoading = false;
          log(error.toString());
          notifyListeners();
    },);
  }

  sendNotification(){
    FlutterLocalNotification.showBigTextNotification(
        title: title,
        body: subTitle,
        fln: flutterLocalNotificationsPlugin);
  }

}