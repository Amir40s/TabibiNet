import 'dart:developer';

import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/Location/location_provider.dart';
import 'package:tabibinet_project/Providers/SignUp/sign_up_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/OtpScreen/otp_screen.dart';
import 'package:tabibinet_project/Screens/StartScreens/SignInScreen/signin_screen.dart';
import 'package:tabibinet_project/Screens/StartScreens/SignUpScreen/Components/sign_up_form.dart';
import 'package:tabibinet_project/model/res/widgets/toast_msg.dart';

import '../../../Providers/SignIn/sign_in_provider.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/dotted_line.dart';
import '../../../model/res/widgets/input_field.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../SignInScreen/Components/sign_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height1 = 10.0;
    double height2 = 30.0;
    final signInP = Provider.of<SignInProvider>(context,listen: false);
    final locationP = Provider.of<LocationProvider>(context,listen: false);
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
                  text: "Create an Account", fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
            ),
            SizedBox(height: height2,),
            const Center(
              child: TextWidget(
                text: "Sign up today for personalized health insights"
                    " and exclusive member perks!", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: true,
                textColor: textColor,maxLines: 2,),
            ),
            SizedBox(height: height2,),
            Form(
                key: formKey,
                child: const SignUpForm()),
            SizedBox(height: height1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer<SignUpProvider>(builder: (context, provider, child) {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: Checkbox(
                      value: provider.isCheck,
                      onChanged: (value) {
                        provider.checkRememberPassword(value!);
                      },),
                  );
                },),
                const TextWidget(
                    text: "Remember Password", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor,fontFamily: AppFonts.semiBold,),
              ],
            ),
            SizedBox(height: height2,),
            Consumer<SignUpProvider>(
              builder: (context, value, child) {
              return value.isLoading ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                ],
              )
                  : SubmitButton(
                title: "Sign Up",
                press: () async {
                  FocusScope.of(context).unfocus();
                  if(value.passwordC.text == value.confirmPasswordC.text){
                    // sentOTP(value.emailC.text.toString());
                    if(formKey.currentState!.validate()){
                      await value.signUp(
                          signInP.specialityC.text.toString(),
                          signInP.specialityDetailC.text.toString(),
                          signInP.yearsOfExperienceC.text.toString(),
                          signInP.appointmentFrom,
                          signInP.appointmentTo,
                          signInP.appointmentFeeC.text.toString(),
                          signInP.userType,
                          locationP.countryName
                      );
                    }
                  }else{
                    ToastMsg().toastMsg("Confirm Password is not Correct");
                  }
                  },
              );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignContainer(
                    onTap: () {
                      signInP.signInWithGoogle(context, locationP.countryName);
                    },
                    image: AppIcons.googleIcon),
                const SizedBox(width: 20,),
                const SignContainer(image: AppIcons.appleIcon),
                const SizedBox(width: 20,),
                const SignContainer(image: AppIcons.facebookIcon),
              ],
            ),
            SizedBox(height: height2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(text: "Already have an account?", fontSize: 16, fontWeight: FontWeight.w500, isTextCenter: false, textColor: textColor),
                InkWell(
                    onTap: () {
                      Get.to(()=>SignInScreen());
                    },
                    child: const TextWidget(text: " Login ", fontSize: 16, fontWeight: FontWeight.w400,
                        isTextCenter: false, textColor: themeColor,fontFamily: AppFonts.medium,)),
                const TextWidget(text: "here", fontSize: 16, fontWeight: FontWeight.w500, isTextCenter: false, textColor: textColor),

              ],
            ),
            SizedBox(height: height2,),
          ],
        ),
      ),
    );
  }

  void sentOTP(String email) async {
    String userName = "usman1903naveed@gmail.com";
    String password = "";
    final smtpServer = gmail(userName, password);
    final message = Message()
    ..from = Address(userName, "Mail Service")
    ..recipients.add(email)
    ..subject = "Mail"
    ..text = "123456";
    try{
      await send(message, smtpServer);
      Get.snackbar("", "Email Send Successfully");
    }catch(e){
      if(kDebugMode){
        log(e.toString());
      }
    }
  }

}

//EmailAuth emailAuth =  EmailAuth(sessionName: "Sample session");
//     var res = await emailAuth.sendOtp(recipientMail: email,otpLength: 4);
//     if(res){
//       Get.to(()=>OtpScreen());
//       ToastMsg().toastMsg("OTP Sent");
//     }else{
//       ToastMsg().toastMsg("We could not sent the OTP");
//     }