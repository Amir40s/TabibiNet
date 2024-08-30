import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/DoctorAppointment/doctor_appointment_provider.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorAppointmentSchedule/Components/doctor_appointment_button.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/SessionDetailScreen/session_detail_screen.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/SmsReminderScreen/sms_reminder_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/FilterScreen/Components/calender_section.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

import '../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../../PatientScreens/FindDoctorScreen/Components/suggestion_container.dart';

class DoctorAppointmentSchedule extends StatelessWidget {
  DoctorAppointmentSchedule({super.key});

  final List<String> suggestion = [
    "All",
    "Pending",
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  final List<Map<String,dynamic>> appointmentStatus = [
    {
      "status" : "Pending",
      "textColor" : purpleColor,
      "boxColor" : purpleColor.withOpacity(0.1),
    },
    {
      "status" : "Cancelled",
      "textColor" : redColor,
      "boxColor" : redColor.withOpacity(0.1),
    },
    {
      "status" : "Completed",
      "textColor" : themeColor,
      "boxColor" : secondaryGreenColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = 20.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header2(text: "Appointment"),
            Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Consumer<DateProvider>(
                        builder: (context, dateProvider, child) {
                          DateTime currentMonth = dateProvider.selectedDate;
                          return Row(
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
                          );
                        },),
                    ),
                    SizedBox(height: height,),
                    CalendarSection(month: DateTime.now()),
                    SizedBox(height: height,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const DoctorAppointmentButton(
                              title: "Smart Agenda",
                              icon: AppIcons.agendaIcon,
                              buttonColor: Color(0xff45D0EE)
                          ),
                          SizedBox(height: height,),
                          DoctorAppointmentButton(
                              onTap: () {
                                Get.to(()=>SmsReminderScreen());
                              },
                              title: "SMS Reminder",
                              icon: AppIcons.smsIcon,
                              buttonColor: const Color(0xffF24C0F)
                          ),
                          SizedBox(height: height,),
                          const Row(
                            children: [
                              TextWidget(
                                text: "Appointments ", fontSize: 20,
                                fontWeight: FontWeight.w600, isTextCenter: false,
                                textColor: textColor,fontFamily: AppFonts.semiBold,),
                              TextWidget(
                                text: "(2)", fontSize: 16,
                                fontWeight: FontWeight.w600, isTextCenter: false,
                                textColor: Colors.grey,fontFamily: AppFonts.semiBold,)
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: height,),
                    SizedBox(
                        height: 40,
                        width: 100.w,
                        child: Consumer<DoctorAppointmentProvider>(
                          builder: (context, provider, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: suggestion.length,
                              itemBuilder: (context, index) {
                                final isSelected = provider.selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    provider.selectButton(index);
                                  },
                                  child: SuggestionContainer(
                                      text: suggestion[index],
                                      boxColor: isSelected ? themeColor : bgColor,
                                      textColor: isSelected ? bgColor : themeColor),
                                );
                              },);
                          },)
                    ),
                    SizedBox(height: height,),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: appointmentStatus.length,
                      itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(()=>SessionDetailScreen(
                            status: appointmentStatus[index]["status"]!,
                            statusTextColor: appointmentStatus[index]["textColor"],
                            boxColor: appointmentStatus[index]["boxColor"],
                          ));
                        },
                        child: Container(
                          width: 100.w,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: greyColor
                              )
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Micheal Rickliff", fontSize: 16.sp,
                                    fontWeight: FontWeight.w600, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                                  TextWidget(
                                    text: "Phone Number: +23883884", fontSize: 12.sp,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,),
                                  TextWidget(
                                    text: "Age: 22", fontSize: 12.sp,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,),
                                  TextWidget(
                                    text: "Gender: Male", fontSize: 12.sp,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,),
                                  TextWidget(
                                    text: "Complaint: Heart Burn", fontSize: 12.sp,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Appointment Date", fontSize: 12.sp,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,),
                                  TextWidget(
                                    text: "4 Aug 2024", fontSize: 16.sp,
                                    fontWeight: FontWeight.w600, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: appointmentStatus[index]["boxColor"],
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: TextWidget(
                                      text: appointmentStatus[index]["status"], fontSize: 16,
                                      fontWeight: FontWeight.w500, isTextCenter: false,
                                      textColor: appointmentStatus[index]["textColor"], fontFamily: AppFonts.medium,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 15,);
                      },),
                    SizedBox(height: height,),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
