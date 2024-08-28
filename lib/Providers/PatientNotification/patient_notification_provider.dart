import 'package:flutter/cupertino.dart';

class PatientNotificationProvider extends ChangeNotifier{

bool _isSound = false;
bool _isVibrate = false;

bool get isSound => _isSound;
bool get isVibrate => _isVibrate;

setSound(bool value){
   _isSound = value;
   notifyListeners();
 }

setVibration(bool value){
  _isVibrate = value;
  notifyListeners();
}

}