import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:tabibinet_project/model/res/widgets/toast_msg.dart';
import '../../constant.dart';
import '../../model/services/FirebaseServices/auth_services.dart';
import '../SignIn/sign_in_provider.dart';

class SignUpProvider extends ChangeNotifier{

  final AuthServices authServices = AuthServices();
  final SignInProvider signInProvider = SignInProvider();

  bool _isCheck = false;
  bool _isLoading = false;
  bool _isSignUpPasswordShow = true;
  bool _isSignUpConfirmPasswordShow = true;

  TextEditingController emailC = TextEditingController();
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

  Future<void> signUp(type, country) async{
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
            "userUid" : userUID,
            "email" : emailC.text.toString(),
            "country" : country,
            "type" : type
          }
      )
          .whenComplete(() {
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



}