import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pinput/pinput.dart';
import 'package:tabibinet_project/Screens/StartScreens/ResetSuccessScreen/reset_success_screen.dart';
import '../../../Constants/app_fonts.dart';
import '../../../Constants/colors.dart';
import '../../../Widgets/submit_button.dart';
import '../../../Widgets/text_widget.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final pinC = TextEditingController();

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
                  text: "Verify OTP", fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
            ),
            SizedBox(height: height2,),
            const Center(
              child: TextWidget(
                text: "Enter OTP code received to authenticate "
                    "your identity and complete verification", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: true,
                textColor: textColor,maxLines: 2,),
            ),
            SizedBox(height: height2,),
            SizedBox(height: height1,),
            Pinput(
              controller: pinC,
              defaultPinTheme: PinTheme(
                height: 60,
                width: 60,
                  textStyle: TextStyle(fontFamily: AppFonts.semiBold,fontSize: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: greyColor
                      )
                  )
              ),
              focusedPinTheme: PinTheme(
                height: 60,
                width: 60,
                  textStyle: TextStyle(fontFamily: AppFonts.semiBold,fontSize: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: greenColor
                  )
                )
              ),
            ),
            SizedBox(height: height2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(text: "Did’nt receive email?", fontSize: 16, fontWeight: FontWeight.w500, isTextCenter: false, textColor: textColor),
                InkWell(
                    onTap: () {
                      // Get.to(()=>SignUpScreen());
                    },
                    child: const TextWidget(
                      text: " Resend", fontSize: 16, fontWeight: FontWeight.w400,
                      isTextCenter: false, textColor: themeColor,fontFamily: AppFonts.medium,)),
              ],
            ),
            SizedBox(height: 120,),
            SubmitButton(
              title: "Send OTP",
              press: () {
                Get.to(()=>ResetSuccessScreen());
              },),
          ],
        ),
      ),
    );
  }
}
