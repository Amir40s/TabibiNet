import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';

import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/input_field.dart';
import '../../../../model/res/widgets/submit_button.dart';
import '../../../../model/res/widgets/text_widget.dart';
import '../../../model/res/constant/app_icons.dart';
import '../MakePaymentScreen/make_payment_screen.dart';
import 'Components/age_section.dart';

class PatientDetailScreen extends StatelessWidget {
  PatientDetailScreen({super.key});

  final nameC = TextEditingController();
  final phoneC = TextEditingController();
  final problemC = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height1 = 20;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Patients details"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    const TextWidget(
                      text: "Full Name", fontSize: 14,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1,),
                    InputField(
                      inputController: nameC,
                      hintText: "Full Name",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset(AppIcons.personIcon,color: greyColor),
                      ),
                    ),
                    SizedBox(height: height1,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Select Your Age Range", fontSize: 14,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        TextWidget(
                          text: " *", fontSize: 14,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: themeColor, fontFamily: AppFonts.semiBold,),
                      ],
                    ),
                    SizedBox(height: height1,),
                    AgeSection(),
                    SizedBox(height: height1,),
                    SizedBox(height: height1,),
                    const TextWidget(
                      text: "Phone Number", fontSize: 14,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1,),
                    InputField(
                      inputController: phoneC,
                      hintText: "Phone Number",
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Icon(Icons.phone_in_talk_rounded,color: greyColor,),
                      ),
                    ),
                    SizedBox(height: height1,),
                    const TextWidget(
                      text: "Gender", fontSize: 14,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubmitButton(
                            bgColor: secondaryGreenColor,
                            textColor: themeColor,
                            width: 43.w,
                            title: "Male",
                            press: (){}
                        ),
                        SubmitButton(width: 43.w,title: "Female", press: (){}),
                      ],
                    ),
                    SizedBox(height: height1,),
                    const TextWidget(
                      text: "Write Your Problem", fontSize: 14,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1,),
                    InputField(
                      inputController: problemC,
                      hintText: "Tell doctor about your problem...",
                      maxLines: 6,
                    ),
                    SizedBox(height: height1,),
                    SubmitButton(title: "Continue", press: () {
                      Get.to(()=>MakePaymentScreen());
                    },),
                    SizedBox(height: height1,),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
