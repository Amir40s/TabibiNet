import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier{

  bool _isCheck = false;
  bool _isSignUpPasswordShow = false;
  bool _isSignUpConfirmPasswordShow = false;

  bool get isCheck => _isCheck;
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

}