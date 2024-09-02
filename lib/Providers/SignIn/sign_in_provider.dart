import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tabibinet_project/model/services/FirebaseServices/auth_services.dart';

import '../../constant.dart';
import '../../model/res/widgets/toast_msg.dart';

class SignInProvider extends ChangeNotifier{

  final AuthServices authServices = AuthServices();

  String _userType = "Patient";
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _isSignInPasswordShow = true;
  bool _isLoading = false;

  String get userType => _userType;
  bool get isSignInPasswordShow => _isSignInPasswordShow;
  bool get isLoading => _isLoading;

  showSignInPassword(){
    _isSignInPasswordShow = !_isSignInPasswordShow;
    notifyListeners();
  }

  setUserType(String userType){
    _userType = userType;
    notifyListeners();
  }

  Future<void> signIn() async {
    _isLoading = true;
    notifyListeners();
    auth.signInWithEmailAndPassword(
        email: emailC.text.toString(),
        password: passwordC.text.toString()
    )
        .then((value) {
      _isLoading = false;
      notifyListeners();
      log("*********Login********");
      // Get.to(()=>);
    },)
        .onError((error, stackTrace) {
      ToastMsg().toastMsg(error.toString());
      _isLoading = false;
      notifyListeners();
      log("*********$error********");
    },);
  }
  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      Future.delayed(
        const Duration(seconds: 4),
            () async {
          if (auth.currentUser != null) {
            // await fireStore.collection('users').doc(auth.currentUser!.uid).set({
            //   'name': auth.currentUser!.displayName,
            //   'email': auth.currentUser!.email,
            //   'profilePicUrl': auth.currentUser!.photoURL,
            //   'uid': '',
            //   'status': 'active',
            //   'phoneNumber': '',
            //   'city': '',
            //   'country': '',
            //   'provider': 'Google',
            //   'state': '',
            //   'joinDate': DateFormat.yMMMd().format(DateTime.now()),
            //   'joinTime': DateFormat('KK:mm: a').format(DateTime.now()),
            // });
          }
          debugPrint('Successfully created');
          // Get.to(() => DocInfoScreen());
        },
      );
      return await auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }
}