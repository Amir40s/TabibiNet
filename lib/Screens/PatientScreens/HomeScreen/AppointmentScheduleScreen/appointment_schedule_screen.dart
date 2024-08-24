import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/AppointmentScheduleScreen/Components/fee_container.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../FilterScreen/Components/calender_section.dart';
import '../FilterScreen/Components/time_section.dart';

class AppointmentScheduleScreen extends StatelessWidget {
  const AppointmentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Appointment"),
            Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: height1,),
                    const CalenderSection(),
                    SizedBox(height: height1,),
                    TimeSection(),
                    SizedBox(height: height1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            text: "Fees Information", fontSize: 20,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.semiBold,),
                          SizedBox(height: height1,),
                          FeeContainer(),
                          SizedBox(height: height1,),
                          FeeContainer(),
                          SizedBox(height: height1,),
                          FeeContainer(),
                          SizedBox(height: 30.sp,),
                          SubmitButton(
                            title: "Continue",
                            press: () {

                          },),
                        ],
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
