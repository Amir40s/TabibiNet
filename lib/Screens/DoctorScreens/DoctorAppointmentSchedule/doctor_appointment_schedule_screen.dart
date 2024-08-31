import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

import '../../../Providers/DoctorAppointment/doctor_appointment_provider.dart';
import '../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/widgets/appointment_container.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../../PatientScreens/FilterScreen/Components/calender_section.dart';
import '../../PatientScreens/FindDoctorScreen/Components/suggestion_container.dart';
import '../ReminderScreen/reminder_screen.dart';
import '../SessionDetailScreen/session_detail_screen.dart';
import 'Components/doctor_appointment_button.dart';

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
                                Get.to(()=>const ReminderScreen(appBarText: "SMS Reminder",));
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
                      return AppointmentContainer(
                          onTap : () {
                            Get.to(() =>
                                SessionDetailScreen(
                                  status: appointmentStatus[index]["status"]!,
                                  statusTextColor: appointmentStatus[index]["textColor"],
                                  boxColor: appointmentStatus[index]["boxColor"],
                                ));
                          },
                          statusText: appointmentStatus[index]["status"],
                          text1: "Appointment Date",
                          text2: "4 Aug 2024",
                          statusTextColor: appointmentStatus[index]["textColor"],
                          boxColor: appointmentStatus[index]["boxColor"]);
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
