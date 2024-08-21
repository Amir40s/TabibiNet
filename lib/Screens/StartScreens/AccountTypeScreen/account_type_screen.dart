import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Screens/StartScreens/SignInScreen/signin_screen.dart';
import 'package:tabibinet_project/Screens/StartScreens/SignUpScreen/sign_up_screen.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/text_widget.dart';
import 'Components/account_container.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height1 = 50.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height1,),
              const Center(
                child: TextWidget(
                    text: "Choose Account Type", fontSize: 24,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor),
              ),
              SizedBox(height: height1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccountContainer(
                    width: 17.w,
                    title: "Patient",
                    image: ImagesPath.male,
                    isIcon: true,
                    textColor: bgColor,
                    cardColor: themeColor,
                  ),
                  AccountContainer(
                    width: 24.w,
                    title: "Health Professional",
                    image: ImagesPath.female,
                    isIcon: false,
                    textColor: textColor,
                    cardColor: bgColor,
                  ),
                ],
              ),
              SizedBox(height: height1,),
              SubmitButton(
                title: "Login",
                press: () {
                Get.to(()=>SignInScreen());
              },),
              const SizedBox(height: 10,),
              SubmitButton(
                title: "Register",
                bgColor: bgColor,
                textColor: themeColor,
                press: () {
                  Get.to(()=>SignUpScreen());
              },),
            ],
          ),
        ),
      ),
    );
  }
}
