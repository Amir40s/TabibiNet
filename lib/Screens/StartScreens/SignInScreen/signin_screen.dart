import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/Screens/StartScreens/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:tabibinet_project/Screens/StartScreens/SignInScreen/Components/sign_container.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/dotted_line.dart';
import '../../../model/res/widgets/input_field.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../SignUpScreen/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

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
                  text: "Sign In", fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
            ),
            SizedBox(height: height2,),
            const Center(
              child: TextWidget(
                  text: "Access your account securely. Sign in to manage"
                      " your personalized experience.", fontSize: 14,
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
            SizedBox(height: height1,),
            const TextWidget(
                text: "Password", fontSize: 14,
                fontWeight: FontWeight.w600, isTextCenter: false,
                textColor: textColor,fontFamily: AppFonts.semiBold,),
            SizedBox(height: height1,),
            InputField(
              inputController: passwordC,
              hintText: "Enter password",
            ),
            SizedBox(height: height1,),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.to(()=>ForgotPasswordScreen());
                },
                child: const TextWidget(
                    text: "Forgot Password?", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: themeColor,fontFamily: AppFonts.semiBold,),
              ),
            ),
            SizedBox(height: height2,),
            SubmitButton(
              title: "Sign In",
              press: () {

            },),
            SizedBox(height: height2,),
            const Row(
              children: [
                Expanded(
                  child: DottedLine(
                    height: 2,
                    color: greyColor,
                    dotLength: 4,
                    spacing: 4,
                    direction: Axis.horizontal,
                  ),
                ),
                TextWidget(
                    text: "Or Continue With", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor,fontFamily: AppFonts.semiBold,),
                Expanded(
                  child: DottedLine(
                    height: 2,
                    color: greyColor,
                    dotLength: 4,
                    spacing: 4,
                    direction: Axis.horizontal,
                  ),
                ),
              ],
            ),
            SizedBox(height: height2,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignContainer(image: AppIcons.googleIcon),
                SizedBox(width: 20,),
                SignContainer(image: AppIcons.appleIcon),
                SizedBox(width: 20,),
                SignContainer(image: AppIcons.facebookIcon),
              ],
            ),
            SizedBox(height: height2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(text: "Don’t have an account?", fontSize: 16, fontWeight: FontWeight.w500, isTextCenter: false, textColor: textColor),
                InkWell(
                    onTap: () {
                      Get.to(()=>SignUpScreen());
                    },
                    child: const TextWidget(
                        text: " Sign Up ", fontSize: 16, fontWeight: FontWeight.w400,
                        isTextCenter: false, textColor: themeColor,fontFamily: AppFonts.medium,)),
                const TextWidget(text: "here", fontSize: 16, fontWeight: FontWeight.w500, isTextCenter: false, textColor: textColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
