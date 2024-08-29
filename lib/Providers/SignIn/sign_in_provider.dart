import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier{

  bool _isSignInPasswordShow = false;

  bool get isSignInPasswordShow => _isSignInPasswordShow;

  showSignInPassword(){
    _isSignInPasswordShow = !_isSignInPasswordShow;
    notifyListeners();
  }

}