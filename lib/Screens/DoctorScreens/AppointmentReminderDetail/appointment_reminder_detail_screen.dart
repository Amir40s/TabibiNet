import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/ReminderScreen/reminder_screen.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../model/res/widgets/info_tile.dart';

class AppointmentReminderDetailScreen extends StatelessWidget {
  const AppointmentReminderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
    double height2 = 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Appointments Reminders"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Patient Details", fontSize: 18.sp,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: themeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: SvgPicture.asset(AppIcons.editIcon),
                        )
                      ],
                    ),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Full Name", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "Micheal Rickliff"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Age", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "22"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Gender", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "Male"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Time of Appointment", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "12:30 - 4 Aug"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Appointment Location", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "In Office"),
                    const SizedBox(height: 30,),
                    SubmitButton(
                      title: "Send Reminder",
                      bgColor: const Color(0xff04AD01).withOpacity(0.1),
                      textColor: const Color(0xff04AD01),
                      bdColor: const Color(0xff04AD01),
                      press: () {
                        Get.to(()=>const ReminderScreen(appBarText: "Send Reminder"));
                    },),
                    SizedBox(height: height1,),
                    SubmitButton(
                      title: "Cancel Appointment",
                      bgColor: const Color(0xffF23A00).withOpacity(0.1),
                      textColor: const Color(0xffF23A00),
                      bdColor: const Color(0xffF23A00),
                      press: () {

                      },),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
