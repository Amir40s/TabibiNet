import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/AppointmentScheduleScreen/Components/fee_container.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/PatientDetailScreen/patient_detail_screen.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../../../Providers/PatientHome/patient_home_provider.dart';
import '../FilterScreen/Components/calender_section.dart';
import '../FilterScreen/Components/time_section.dart';

class AppointmentScheduleScreen extends StatelessWidget {
  const AppointmentScheduleScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final DateTime currentMonth = Provider.of<DateProvider>(context,listen: false).selectedDate;

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
                    Consumer<DateProvider>(
                      builder: (context, dateProvider, child) {
                        DateTime currentMonth = dateProvider.selectedDate;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const TextWidget(
                              text: "Schedules", fontSize: 20,
                              fontWeight: FontWeight.w600, isTextCenter: false,
                              textColor: textColor, fontFamily: AppFonts.semiBold,),
                            const Spacer(),
                            InkWell(
                              onTap:  () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: currentMonth,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (selectedDate != null) {
                                  dateProvider.updateSelectedDate(selectedDate);
                                }
                              },
                              child: Row(
                                children: [
                                  TextWidget(
                                      text: DateFormat('MMMM-yyyy').format(currentMonth), fontSize: 12,
                                      fontWeight: FontWeight.w400, isTextCenter: false,
                                      textColor: textColor),
                                  const SizedBox(width: 8,),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: bgColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1.2
                                          )
                                        ]
                                    ),
                                    child: const Icon(CupertinoIcons.forward,color: themeColor,size: 20,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },),
                    SizedBox(height: height1,),
                    Consumer<DateProvider>(
                      builder: (context, dateProvider, child) {
                        return CalendarSection(month: dateProvider.selectedDate);
                      },),
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
                          const FeeContainer(),
                          SizedBox(height: height1,),
                          const FeeContainer(),
                          SizedBox(height: height1,),
                          const FeeContainer(),
                          SizedBox(height: 30.sp,),
                          SubmitButton(
                            title: "Continue",
                            press: () {
                              Get.to(()=> PatientDetailScreen());
                          },),
                        ],
                      ),
                    ),
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
