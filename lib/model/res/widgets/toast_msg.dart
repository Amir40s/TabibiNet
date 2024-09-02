import 'package:fluttertoast/fluttertoast.dart';
import 'package:tabibinet_project/constant.dart';

class ToastMsg{
  void toastMsg(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: themeColor,
        textColor: bgColor,
        fontSize: 12
    );
  }
}