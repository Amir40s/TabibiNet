import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/AppointmentReminderDetail/appointment_reminder_detail_screen.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

class AppointmentReminderScreen extends StatelessWidget {
  const AppointmentReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Appointment Reminders"),
            Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: greyColor
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TextWidget(
                              text: "Micheal Rickliff", fontSize: 16.sp,
                              fontWeight: FontWeight.w600, isTextCenter: false,
                              textColor: textColor, fontFamily: AppFonts.semiBold,),
                            const SizedBox(height: 10,),
                            TextWidget(
                              text: "ID Number: #33883", fontSize: 14.sp,
                              fontWeight: FontWeight.w400, isTextCenter: false,
                              textColor: textColor, ),

                          ],
                        ),
                        SubmitButton(
                          width: 26.w,
                          height: 40,
                          title: "View Detail",
                          textColor: themeColor,
                          bgColor: themeColor.withOpacity(0.1),
                          press: () {
                            Get.to(()=>const AppointmentReminderDetailScreen());
                        },)
                      ],
                    ),
                  );
                },
                    separatorBuilder: (context, index) {
                  return const SizedBox(height: 15,);
                },
                    itemCount: 10
                )
            )
          ],
        ),
      ),
    );
  }
}
