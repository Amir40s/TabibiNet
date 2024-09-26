import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constant.dart';
import '../../model/res/constant/app_fonts.dart';
import '../../model/res/constant/app_icons.dart';
import '../../model/res/widgets/text_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: Container(
          decoration: const BoxDecoration(
            color: themeColor
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ChatHeader(),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        color: secondaryGreenColor,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40)
                        )
                      ),
                      child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.all(10),
                        children: [
                          _buildUserMessage('Hi, good afternoon Michel', false,'09:10'),
                          _buildUserMessage('Hello Good Afternoon Dr.', true,'09:10'),
                          _buildUserMessage(
                              'I’ve been experiencing some discomfort in my lower abdomen',
                              true,'09:10'),
                          _buildUserMessage(
                              'Have you noticed any other symptoms, such as fever or changes in urination?',
                              false,'09:10'),
                          _buildUserMessage('Hi, good afternoon Michel', false,'09:10'),
                          _buildUserMessage('Hello Good Afternoon Dr.', true,'09:10'),
                          _buildUserMessage(
                              'I’ve been experiencing some discomfort in my lower abdomen',
                              true,'09:10'),
                          _buildUserMessage(
                              'Have you noticed any other symptoms, such as fever or changes in urination?',
                              false,'09:10'),
                          _buildUserMessage('Hi, good afternoon Michel', false,'09:10'),
                          _buildUserMessage('Hello Good Afternoon Dr.', true,'09:10'),
                          _buildUserMessage(
                              'I’ve been experiencing some discomfort in my lower abdomen',
                              true,'09:10'),
                          _buildUserMessage(
                              'Have you noticed any other symptoms, such as fever or changes in urination?',
                              false,'09:10'),
                        ],
                      ),
                    ),
                  ),
                  _buildMessageInput(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserMessage(String message, bool isSender, String time) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSender ? Colors.white : Colors.blue, // Blue for received, white for sent
          borderRadius: isSender
              ? BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          )
              : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: isSender ? Border.all(color: Colors.grey[300]!) : null, // Border for sender
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                message,
                style: TextStyle(
                  color: isSender ? Colors.black87 : Colors.white, // Black text for sent, white for received
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSender ? Colors.grey : Colors.white70, // Grey time for sender, light white for receiver
                    ),
                  ),
                  if (isSender) // Show double-check icon only for sent messages
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.done_all,
                        size: 16,
                        color: Colors.blue, // Blue checkmark for seen status
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: secondaryGreenColor,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: themeColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.photo, color: themeColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: themeColor),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined, color: greyColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: greyColor,fontFamily: AppFonts.medium),
                        hintText: 'Message',
                        fillColor: bgColor,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.attach_file, color: greyColor),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: themeColor,
            child: SvgPicture.asset(
              AppIcons.sendIcon,
              colorFilter: const ColorFilter.mode(
                  bgColor,
                  BlendMode.srcIn
              ),),
          ),
        ],
      ),
    );
  }

}


class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle
                ),
                child: const Center(child: Icon(CupertinoIcons.back,color: themeColor,size: 24,)),
              ),
            ),
            const SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                      color: skyBlueColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  // child: ImageLoaderWidget(imageUrl: value.imageUrl)
                // value.image != null ? Image.file(value.image!, fit: BoxFit.cover,)
                //     : const SizedBox(),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40.w,
                  child: const TextWidget(
                      text: "Michel Reckliff", fontSize: 20,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: bgColor),
                ),
                const TextWidget(
                    text: "Online", fontSize: 12,
                    fontWeight: FontWeight.w400, isTextCenter: false,
                    textColor: bgColor),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
