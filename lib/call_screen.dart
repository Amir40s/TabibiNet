import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/call_invitation.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

import 'model/res/widgets/no_found_card.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Appointment Calls"),
            Expanded(
              child: StreamBuilder(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
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
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            backgroundColor: purpleColor.withOpacity(.3),
                            child: SvgPicture.asset(AppIcons.upcomingAppointmentIcon),
                          ),
                        ),
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            backgroundColor: purpleColor,
                            child: SvgPicture.asset(AppIcons.phone),
                          ),
                        ),
                      );
                    },);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
