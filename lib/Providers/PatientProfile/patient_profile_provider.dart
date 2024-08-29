import 'package:flutter/cupertino.dart';

class PatientProfileProvider extends ChangeNotifier{

  int? _selectFaq;
  int? _selectFaqCat;

  int? get selectFaq => _selectFaq;
  int? get selectFaqCat => _selectFaqCat;

  setFaq(index){
    _selectFaq = index;
    notifyListeners();
  }

  setFaqCat(int index){
    _selectFaqCat = index;
    notifyListeners();
  }

}