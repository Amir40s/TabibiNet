import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/StartScreens/PayWallScreens/Components/plan_row.dart';
import 'package:tabibinet_project/Screens/UserScreens/HomeScreen/user_home_screen.dart';

import '../../../../Constants/colors.dart';
import '../../../../Widgets/text_widget.dart';
import '../../../Constants/app_fonts.dart';
import '../../../Widgets/submit_button.dart';

class AdvancePlanScreen extends StatelessWidget {
  const AdvancePlanScreen({super.key});

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
            text: "550 dhs/Month", fontSize: 20, fontWeight: FontWeight.w500,
            isTextCenter: false, textColor: textColor,fontFamily: AppFonts.medium,),
          const TextWidget(
            text: "All Features from Basic Offer", fontSize: 20, fontWeight: FontWeight.w500,
            isTextCenter: false, textColor: themeColor,fontFamily: AppFonts.medium,),
          const SizedBox(height: 10,),
          const PlanRow(tickColor: themeColor, text: "Comprehensive Access to Electronic Medical Records (EMR)"),
          const PlanRow(tickColor: themeColor, text: "Unlimited Electronic Prescriptions"),
          const PlanRow(tickColor: themeColor, text: "Advanced Patient Management"),
          const PlanRow(tickColor: themeColor, text: "Detailed Reports & Analytics"),
          const PlanRow(tickColor: themeColor, text: "Unlimited Document Management"),
          const PlanRow(tickColor: themeColor, text: "Integration with Medical Devices"),
          const PlanRow(tickColor: themeColor, text: "Advance Notifications and Alerts"),
          const PlanRow(tickColor: themeColor, text: "Offline Access"),
          const PlanRow(tickColor: themeColor, text: "Priority Customer Support"),
          const PlanRow(tickColor: themeColor, text: "Automated Search"),
          const SizedBox(height: 10,),
          SubmitButton(
            title: "Get Started",
            radius: 100,
            press: () {
              Get.to(()=>UserHomeScreen());
            },)
        ],
      ),
    );
  }
}