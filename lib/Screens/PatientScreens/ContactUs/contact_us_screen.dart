import 'package:flutter/material.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/input_field.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height1 = 20;
    double height2 = 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Contact Us"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Full Name", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "Full Name",
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "Phone Number *", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "Phone Number",
                  ),
                  SizedBox(height: height1,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Write Your Problem", fontSize: 14,
                        fontWeight: FontWeight.w600, isTextCenter: false,
                        textColor: textColor, fontFamily: AppFonts.semiBold,),
                      TextWidget(
                        text: "Max 250 words", fontSize: 12,
                        fontWeight: FontWeight.w400, isTextCenter: false,
                        textColor: textColor,),
                    ],
                  ),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "Tell doctor about your problem....",
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SubmitButton(
            title: "Send Massage",
            press: () {

          },),
        ),
      ),
    );
  }
}
