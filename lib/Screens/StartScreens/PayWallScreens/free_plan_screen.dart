import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientBottomNavBar/patient_bottom_nav_bar.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/Screens/StartScreens/PayWallScreens/Components/plan_row.dart';

import '../../../constant.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../../PatientScreens/PatientHomeScreen/patient_home_screen.dart';

class FreePlanScreen extends StatelessWidget {
  const FreePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0xffE7EBFF)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Free", fontSize: 20, fontWeight: FontWeight.w500,
            isTextCenter: false, textColor: textColor,fontFamily: AppFonts.medium,),
          const SizedBox(height: 10,),
          const PlanRow(tickColor: textColor, text: "Personalized Dashboard"),
          const PlanRow(tickColor: textColor, text: "Appointment Management (Limited to 30 Appointment/Month)"),
          const PlanRow(tickColor: textColor, text: "Secure Messaging (Limited to 50 Messages/Month)"),
          const PlanRow(tickColor: textColor, text: "Access to Medical Resources (Limited Selection)"),
          const PlanRow(tickColor: textColor, text: "Basic Notifications & Alerts"),
          const PlanRow(tickColor: textColor, text: "Multilingual Support"),
          const SizedBox(height: 10,),
          SubmitButton(
            title: "Get Started",
            radius: 100,
            press: () {
              Get.to(()=>const PatientBottomNavBar());
            },)
        ],
      ),
    );
  }
}
