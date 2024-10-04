import 'package:tabibinet_project/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ZegoCloudService {
  static const int appID = Statics.appID; // Replace with your ZEGOCLOUD appID
  static const String appSign = Statics.appSign; // Replace with your ZEGOCLOUD appSign

  static Future<void> init() async {
    await ZegoUIKit().init(appID: appID, appSign: appSign);
  }

  static Future<void> loginUser(String userID, String userName) async {
    ZegoUIKit().login(userID,userName);
  }

  static Future<void> logoutUser() async {
    ZegoUIKit().logout();
  }
}