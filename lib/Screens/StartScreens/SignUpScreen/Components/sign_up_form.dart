import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/SignUp/sign_up_provider.dart';
import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/widgets/input_field.dart';
import '../../../../model/res/widgets/text_widget.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});


  @override
  Widget build(BuildContext context) {
    final signUpP = Provider.of<SignUpProvider>(context,listen: false);
    double height1 = 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Name", fontSize: 14,
          fontWeight: FontWeight.w600, isTextCenter: false,
          textColor: textColor,fontFamily: AppFonts.semiBold,),
        SizedBox(height: height1,),
        InputField(
          inputController: signUpP.nameC,
          hintText: "Enter Name",
        ),
        SizedBox(height: height1,),
        const TextWidget(
          text: "Email", fontSize: 14,
          fontWeight: FontWeight.w600, isTextCenter: false,
          textColor: textColor,fontFamily: AppFonts.semiBold,),
        SizedBox(height: height1,),
        InputField(
          inputController: signUpP.emailC,
          hintText: "Enter email",
        ),
        SizedBox(height: height1,),
        const TextWidget(
          text: "Phone Number", fontSize: 14,
          fontWeight: FontWeight.w600, isTextCenter: false,
          textColor: textColor,fontFamily: AppFonts.semiBold,),
        SizedBox(height: height1,),
        InputField(
          inputController: signUpP.phoneC,
          hintText: "Enter Phone Number",
        ),
        SizedBox(height: height1,),
        const TextWidget(
          text: "Password", fontSize: 14,
          fontWeight: FontWeight.w600, isTextCenter: false,
          textColor: textColor,fontFamily: AppFonts.semiBold,),
        SizedBox(height: height1,),
        Consumer<SignUpProvider>(
          builder: (context, value, child) {
            return InputField(
              inputController: value.passwordC,
              hintText: "Enter password",
              obscureText: value.isSignUpPasswordShow,
              suffixIcon: InkWell(
                onTap: () {
                  value.showSignUpPassword();
                },
                child: Icon(
                  value.isSignUpPasswordShow ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: Colors.grey,
                ),
              ),
            );
          },),
        SizedBox(height: height1,),
        const TextWidget(
          text: "Confirm Password", fontSize: 14,
          fontWeight: FontWeight.w600, isTextCenter: false,
          textColor: textColor,fontFamily: AppFonts.semiBold,),
        SizedBox(height: height1,),
        Consumer<SignUpProvider>(
          builder: (context, value, child) {
            return InputField(
              inputController: value.confirmPasswordC,
              hintText: "Enter password",
              obscureText: value.isSignUpConfirmPasswordShow,
              suffixIcon: InkWell(
                onTap: () {
                  value.showSignUpConfirmPassword();
                },
                child: Icon(
                  value.isSignUpConfirmPasswordShow ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: Colors.grey,
                ),
              ),
            );
          },),
      ],
    );
  }
}
