import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier{

  String _countryName = "Morocco";
  String get countryName => _countryName;

  selectCountryName(String countryName){
    _countryName = countryName;
    notifyListeners();
  }


}