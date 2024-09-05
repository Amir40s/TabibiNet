import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/input_field.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

class PatientEditProfileScreen extends StatelessWidget {
  PatientEditProfileScreen({super.key});

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
            const Header(text: "Edit Profile"),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: greyColor,
                            shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10.sp),
                          decoration: const BoxDecoration(
                            color: themeColor,
                            shape: BoxShape.circle
                        ),
                          child: const Icon(Icons.camera_alt_outlined,color: bgColor,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "First Name", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "Enter name",
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "Last Name", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "Enter name",
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "Date of Birth", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  InputField(
                    inputController: nameC,
                    hintText: "24/25/2024",
                    suffixIcon: const Icon(Icons.calendar_month_rounded,color: greyColor,),
                  ),
                  SizedBox(height: height1,),
                  SubmitButton(
                    title: "Save Changes",
                    press: () {

                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
