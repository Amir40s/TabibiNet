import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier{

  String _userType = "Patient";
  bool _isSignInPasswordShow = false;

  String get userType => _userType;
  bool get isSignInPasswordShow => _isSignInPasswordShow;

  showSignInPassword(){
    _isSignInPasswordShow = !_isSignInPasswordShow;
    notifyListeners();
  }

  setUserType(String userType){
    _userType = userType;
    notifyListeners();
  }

}