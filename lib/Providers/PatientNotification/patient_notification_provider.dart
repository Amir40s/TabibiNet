import 'package:flutter/cupertino.dart';
import 'package:tabibinet_project/constant.dart';

class PatientNotificationProvider extends ChangeNotifier {

  bool _isSound = false;
  bool _isVibrate = false;

  bool get isSound => _isSound;
  bool get isVibrate => _isVibrate;

  Future<void> storeNotification({
    required String title,
    required String subTitle,
    required String type,
  })async{
    final docId = DateTime.now().millisecondsSinceEpoch;
    await fireStore.collection("users").doc(auth.currentUser!.uid)
        .collection("notifications").doc(docId.toString()).set({
      "id": docId,
      "title": title,
      "subTitle": subTitle,
      "read": "false",
      "type": type,
    });
  }

  setSound(bool value){
    _isSound = value;
    notifyListeners();
  }

  setVibration(bool value){
    _isVibrate = value;
    notifyListeners();
  }

}