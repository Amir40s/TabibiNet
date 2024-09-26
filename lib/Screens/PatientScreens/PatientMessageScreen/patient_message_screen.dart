import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibinet_project/Screens/ChatScreens/chat_screen.dart';

import '../../../model/res/widgets/chat_user_card.dart';
import '../../../model/res/widgets/header.dart';

class PatientMessageScreen extends StatelessWidget {
  const PatientMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Header2(text: "Message"),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(()=>ChatScreen());
                      },
                      child: const ChatUserCard(
                        title: "Michael Faraday",
                        subTitle: "Hey! How are you?",
                        trailingText: "7 Nov",
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}
