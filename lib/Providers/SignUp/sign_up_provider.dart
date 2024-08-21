import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier{
  bool _isCheck = false;
  bool get isCheck => _isCheck;

  checkRememberPassword(bool isCheck){
    _isCheck = isCheck;
    notifyListeners();
  }

}