import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/submit_button.dart';
import '../../../../model/res/widgets/text_widget.dart';
import '../../../Providers/PatientAppointment/patient_appointment_provider.dart';
import '../../../model/data/fee_information_model.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/dotted_border_container.dart';
import '../../../model/res/widgets/toast_msg.dart';
import '../FilterScreen/Components/calender_section.dart';
import '../FilterScreen/Components/time_section.dart';
import '../PatientDetailScreen/patient_detail_screen.dart';
import 'Components/fee_container.dart';

class AppointmentScheduleScreen extends StatelessWidget {
  AppointmentScheduleScreen({super.key});

  final List<Map<String ,String>> feesList = [
    {
      "title" : "Consultancy",
      "subTitle" : "Book a free consultancy",
    },
    {
      "title" : "Voice Call",
      "subTitle" : "Can make a voice call with doctor",
    },
    {
      "title" : "Help Center ",
      "subTitle" : "Contact with Admin if you are facing Any issues",
    },
  ];

  @override
  Widget build(BuildContext context) {

    final patientAppointmentP = Provider.of<PatientAppointmentProvider>(context,listen: false);
    // final DateTime currentMonth = Provider.of<DateProvider>(context,listen: false).selectedDate;

    double height1 = 20;
    double height2 = 10;
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
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (selectedDate != null) {
                                  patientAppointmentP.setAppointmentDate(selectedDate);
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
                        return CalendarSection(
                          month: dateProvider.selectedDate,
                          firstDate: DateTime.now(),
                        );
                      },),
                    SizedBox(height: height1,),
                    Consumer<PatientAppointmentProvider>(
                      builder: (context, value, child) {
                      return TimeSection(
                        filteredTime: value.filteredTime,
                      );
                    },),
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
                          StreamBuilder<List<FeeInformationModel>>(
                            stream: patientAppointmentP.fetchFeeInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(child: Text('No users found'));
                              }

                              // List of users
                              final fees = snapshot.data!;

                              return Consumer<PatientAppointmentProvider>(
                                builder: (context, provider, child) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: fees.length,
                                    itemBuilder: (context, index) {
                                      final isSelected = provider.selectFeeIndex == index;
                                      final fee = fees[index];
                                      return FeeContainer(
                                        onTap: () {
                                          provider.setSelectedFee(
                                              index,
                                              fee.type,
                                              fee.fees,
                                              fee.id,
                                              fee.subTitle
                                          );
                                        },
                                        title: fee.type,
                                        subTitle: fee.subTitle,
                                        borderColor: isSelected ? themeColor : greyColor,
                                        icon: isSelected ? AppIcons.radioOnIcon : AppIcons.radioOffIcon,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: height1,);
                                    },
                                  );
                                },);
                            },
                          ),
                          SizedBox(height: height1,),
                          TextWidget(
                            text: "Any Documented Test Reports", fontSize: 14.sp,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.semiBold,),
                          SizedBox(height: height1,),
                          Consumer<PatientAppointmentProvider>(
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  value.pickFile();
                                },
                                child: DottedBorderContainer(
                                    width: 100.w,
                                    height: 8.h,
                                    borderColor: greyColor,
                                    strokeWidth: 1.5,
                                    dashWidth: 10,
                                    borderRadius: 15,
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.attach_file_outlined,color: themeColor,),
                                        SizedBox(
                                          width: value.selectedFilePath != null ? 60.w : 19.w,
                                          child: TextWidget(
                                              text: value.selectedFilePath != null ? "${value.selectedFilePath}"
                                                  : "Add a file",
                                              maxLines: 1,
                                              fontFamily: AppFonts.medium,
                                              fontSize: 16.sp, fontWeight: FontWeight.w500,
                                              isTextCenter: false, textColor: themeColor),
                                        ),
                                        value.selectedFilePath == null ? TextWidget(
                                            text: " or drop it here",
                                            fontFamily: AppFonts.medium,
                                            fontSize: 16.sp, fontWeight: FontWeight.w500,
                                            isTextCenter: false, textColor: textColor)
                                            : const SizedBox(),
                                      ],
                                    )
                                ),
                              );
                            },),
                          SizedBox(height: height2,),
                          TextWidget(
                            text: "File should be pdf, docs or ppt", fontSize: 12.sp,
                            fontWeight: FontWeight.w500, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.regular,),
                          SizedBox(height: 8.w,),
                          SubmitButton(
                            title: "Continue",
                            press: () {
                              if(patientAppointmentP.appointmentTime != null){
                                if(patientAppointmentP.appointmentDate == null){
                                  patientAppointmentP.setAppointmentDate(DateTime.now());
                                }
                                Get.to(()=> PatientDetailScreen());
                              }else{
                                ToastMsg().toastMsg("Select Appointment Time!",toastColor: redColor);
                              }
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
