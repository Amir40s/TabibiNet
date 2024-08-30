import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorAppointmentSchedule/doctor_appointment_schedule_screen.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/Components/doctor_home_header.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/Components/quick_access_container.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/Components/quick_access_section.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/Components/range_select_calendar.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../model/res/widgets/bottom_nav_bar.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const DoctorHomeHeader(),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: height,),
                    Container(
                      height: 25.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    SizedBox(height: height,),
                    SubmitButton(
                      title: "View E-prescriptions",
                      press: () {

                    },),
                    SizedBox(height: height,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          text: "Appointments", fontSize: 20,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor,fontFamily: AppFonts.semiBold,),
                        InkWell(
                          onTap: () {
                            Get.to(()=>DoctorAppointmentSchedule());
                          },
                          child: const TextWidget(
                            text: "View All", fontSize: 14,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: themeColor,fontFamily: AppFonts.semiBold,),
                        ),

                      ],
                    ),
                    SizedBox(height: height,),
                    const RangeSelectionCalendar(),
                    SizedBox(height: height,),
                    const TextWidget(
                      text: "Quick Access", fontSize: 20,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor,fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height,),
                    const QuickAccessSection(),
                    SizedBox(height: height,),
                  ],
            ))
          ],
        ),
        bottomNavigationBar: const CustomBottomNavBar2(),
      ),
    );
  }
}
