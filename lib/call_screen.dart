import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/widgets/call_invitation.dart';

import 'model/res/widgets/no_found_card.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: StreamBuilder(
            stream: fireStore.collection("calls").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return const NoFoundCard(
                  subTitle: "",
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var call = snapshot.data!.docs[index];
                  return ListTile(
                    onTap: () {
                      Get.to(()=>CallInvitationPage(
                        callID: call["callId"],
                        isVideoCall: false,
                      ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  );
                },);
            },
        ),
      ),
    );
  }
}
