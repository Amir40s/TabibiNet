import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Screens/ChatScreens/chat_patient_screen.dart';

import '../../../Providers/Profile/profile_provider.dart';
import '../../../model/res/widgets/chat_user_card.dart';
import '../../../model/res/widgets/header.dart';

class PatientMessageScreen extends StatelessWidget {
  const PatientMessageScreen({super.key});

  // Stream<List<AppointmentModel>> fetchPatientsSingle() {
  //   return fireStore.collection('appointment')
  //       .where("doctorId",isEqualTo: auth.currentUser!.uid)
  //       .where("status",isEqualTo: "upcoming")
  //       .snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => AppointmentModel.fromDocumentSnapshot(doc)).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final patientP = Provider.of<ProfileProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Header2(text: "Message"),
            Expanded(
                child: Consumer<ProfileProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // final chat = chats[index];
                        return InkWell(
                          onTap: () {
                            Get.to(()=>ChatPatientScreen());
                          },
                          child: ChatUserCard(
                            title: "Farhan",
                            subTitle: "Hi How are you?",
                            trailingText: "7 Nov",
                          ),
                        );
                      },
                    );
                  },)
            )
          ],
        ),
      ),
    );
  }
}
//StreamBuilder(
//                       stream: fireStore.collection("chatRooms")
//                           .where("patientEmail",isEqualTo: patientP.email).snapshots(),
//                       builder: (context, snapshot) {
//
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return const Center(child: CircularProgressIndicator());
//                         }
//                         if (snapshot.hasError) {
//                           return Center(child: Text('Error: ${snapshot.error}'));
//                         }
//                         if (!snapshot.hasData) {
//                           return const NoFoundCard();
//                         }
//
//                         // List of users
//                         final chats = snapshot.data!.docs;
//
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: chats.length,
//                           itemBuilder: (context, index) {
//                             final chat = chats[index];
//                             return InkWell(
//                               onTap: () {
//                                 // Get.to(()=>ChatScreen(
//                                 //
//                                 // ));
//                               },
//                               child: ChatUserCard(
//                                 title: "chat[""]",
//                                 subTitle: chat["message"],
//                                 trailingText: "7 Nov",
//                               ),
//                             );
//                           },
//                         );
//                       },)