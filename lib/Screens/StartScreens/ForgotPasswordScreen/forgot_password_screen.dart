import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/StartScreens/OtpScreen/otp_screen.dart';

import '../../../Constants/app_fonts.dart';
import '../../../Constants/colors.dart';
import '../../../Widgets/input_field.dart';
import '../../../Widgets/submit_button.dart';
import '../../../Widgets/text_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height1 = 10.0;
    double height2 = 30.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 50,),
            const Center(
              child: TextWidget(
                  text: "Forgot Password", fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
            ),
            SizedBox(height: height2,),
            const Center(
              child: TextWidget(
                text: "Reset your password securely for "
                    "uninterrupted access to your account.", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: true,
                textColor: textColor,maxLines: 2,),
            ),
            SizedBox(height: height2,),
            const TextWidget(
              text: "Email", fontSize: 14,
              fontWeight: FontWeight.w600, isTextCenter: false,
              textColor: textColor,fontFamily: AppFonts.semiBold,),
            SizedBox(height: height1,),
            InputField(
              inputController: emailC,
              hintText: "Enter email",
            ),
            SizedBox(height: 120,),
            SubmitButton(
              title: "Send OTP",
              press: () {
                Get.to(()=>OtpScreen());
              },),
          ],
        ),
      ),
    );
  }
}
