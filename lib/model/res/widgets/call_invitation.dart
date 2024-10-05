import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/Profile/profile_provider.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/toast_msg.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../zego_cloud_services/zego_cloud_services.dart';

class CallInvitationPage extends StatelessWidget {
  const CallInvitationPage({
    super.key,
    required this.callID,
    this.isVideoCall = true
  });

  final String callID;
  final bool isVideoCall;

  back(context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<ProfileProvider>(
          builder: (context, value, child) {
            return isVideoCall ?
            Stack(
              alignment: Alignment.topRight,
              children: [
                ZegoUIKitPrebuiltCall(
                  appID: ZegoCloudService.appID,
                  appSign: ZegoCloudService.appSign,
                  userID: auth.currentUser!.uid,  // Use the logged-in user's ID
                  userName: value.name,  // Use the logged-in user's name
                  callID: callID,
                  config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
                  plugins: [ZegoUIKitSignalingPlugin()],
                  onDispose: () async {
                    onHangUp();
                  },
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      AppIcons.crossIcon,
                      height: 30,
                      colorFilter: ColorFilter.mode(bgColor, BlendMode.srcIn),
                    ),
                  ),
                ),
              ]
            ) :
            Stack(
                alignment: Alignment.topRight,
                children: [
                  ZegoUIKitPrebuiltCall(
                    appID: ZegoCloudService.appID,
                    appSign: ZegoCloudService.appSign,
                    userID: auth.currentUser!.uid,  // Use the logged-in user's ID
                    userName: value.name,  // Use the logged-in user's name
                    callID: callID,
                    config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
                    plugins: [ZegoUIKitSignalingPlugin()],
                    onDispose: () async {
                      onHangUp();
                    },
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(
                        AppIcons.crossIcon,
                        height: 30,
                        colorFilter: ColorFilter.mode(bgColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ]
            );
          },),
      ),
    );
  }
  onHangUp()async{
    fireStore.collection("calls").doc(callID).update({
      "status" : "Call Ended"
    }).whenComplete(() {
      ToastMsg().toastMsg("Call Ended",toastColor: Colors.red);
    },);
  }
}




