import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/Profile/profile_provider.dart';
import 'constant.dart';
import 'model/res/widgets/call_invitation.dart';
import 'model/zego_cloud_services/zego_cloud_services.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // You can dynamically generate call IDs

  @override
  void initState() {
    super.initState();
    ZegoCloudService.init();
    final pro = Provider.of<ProfileProvider>(context,listen: false);
    ZegoCloudService.loginUser("zHcmfarcpZRegkzjkj8F0CSjyuQ2", "Retnab");
  }

  @override
  void dispose() {
    ZegoCloudService.logoutUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final String callID = Random(10).toString();
                await storeCallId(callID, "121324341");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallInvitationPage(callID: callID, isVideoCall: true),
                  ),
                );
              },
              child: Text('Start Video Call'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String callID = Random(10).toString();
                await storeCallId(callID, "121324341");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallInvitationPage(callID: callID, isVideoCall: false),
                  ),
                );
              },
              child: Text('Start Audio Call'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> storeCallId(callId,doctorId)async{
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    fireStore.collection("calls").doc(id).set({
      "id": id,
      "callId": callId,
      "patientId": auth.currentUser!.uid,
      "doctorId": doctorId,
    });
  }
}