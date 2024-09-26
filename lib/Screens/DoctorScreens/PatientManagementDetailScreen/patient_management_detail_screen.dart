import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/dotted_line.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/info_tile.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../model/data/appointment_model.dart';
import '../EPrescriptionScreen/Components/prescription_container.dart';
import '../EPrescription_data/e_prescription_data_screen.dart';
import '../EmrDetailScreen/emr_detail_screen.dart';
import '../EmrScreen/emr_screen.dart';
import '../PatientManagementData/patient_management_data_screen.dart';
import '../PatientsLabReportScreen/patient_lab_report_screen.dart';

class PatientManagementDetailScreen extends StatelessWidget {
  const PatientManagementDetailScreen({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.userProblem,
  });

  final String patientName;
  final String patientAge;
  final String patientGender;
  final String userProblem;

  @override
  Widget build(BuildContext context) {
    double height1 = 20.0;
    double height2 = 10.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Patient Details"),
            Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    TextWidget(
                      text: "Personal Details", fontSize: 18.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Full Name", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    InfoTile(title: patientName),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Age", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    InfoTile(title: patientAge),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Gender", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    InfoTile(title: patientGender),
                    SizedBox(height: height1,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrescriptionContainer(
                            text: "Manage Patients",
                            icon: AppIcons.managePatientIcon,
                            boxColor: const Color(0xff45D0EE),
                            onTap: () {
                              Get.to(()=>PatientManagementDataScreen());
                            },
                          ),
                          SizedBox(width: 4.w,),
                          PrescriptionContainer(
                            text: "EMR",
                            icon: AppIcons.emrIcon,
                            boxColor: const Color(0xffF24C0F),
                            onTap: () {
                              Get.to(()=> EmrDetailScreen(

                                patientAge: patientAge,
                                patientGender: patientGender,
                                patientName: patientName,
                                userProblem: userProblem,

                              ));
                            },
                          ),

                        ],
                      )
                    ),
                    SizedBox(height: 3.h,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrescriptionContainer(
                            text: "Results",
                            icon: AppIcons.resultIcon,
                            boxColor: const Color(0xffDEBA05),
                            onTap: () {
                              Get.to(()=>const PatientLabReportScreen());
                            },
                          ),
                          SizedBox(width: 4.w,),
                          PrescriptionContainer(
                            text: "E-prescription",
                            icon: AppIcons.prescriptionIcon,
                            boxColor: const Color(0xff0596DE),
                            onTap: () {
                              Get.to(()=>const EPrescriptionDataScreen());
                            },
                          ),

                        ],
                      )
                    ),
                    SizedBox(height: height1,),
                    Container(
                      width: 100.w,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color(0xffE6F5FC),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: greyColor,
                                blurRadius: 1,
                                spreadRadius: .5
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Active Medical Conditions", fontSize: 18.sp,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.semiBold,),
                          SizedBox(height: height1,),
                          const DottedLine(color: greyColor,),
                          SizedBox(height: height1,),
                          TextWidget(
                            text: userProblem, fontSize: 18.sp,
                            fontWeight: FontWeight.w400, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.regular,),
                        ],
                      ),
                    ),
                    SizedBox(height: height1,),
                    SubmitButton(
                      title: "Chat",
                      icon: CupertinoIcons.chat_bubble_2_fill,
                      bgColor: bgColor,
                      textColor: themeColor,
                      iconColor: themeColor,
                      press: () {

                      },),

                    // SizedBox(height: height1,),
                    // Container(
                    //   width: 100.w,
                    //   padding: const EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xffE6F5FC),
                    //     borderRadius: BorderRadius.circular(20),
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         color: greyColor,
                    //         blurRadius: 1,
                    //         spreadRadius: .5
                    //       )
                    //     ]
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       TextWidget(
                    //         text: "Resolved Medical Conditions", fontSize: 18.sp,
                    //         fontWeight: FontWeight.w600, isTextCenter: false,
                    //         textColor: textColor, fontFamily: AppFonts.semiBold,),
                    //       SizedBox(height: height1,),
                    //       const DottedLine(color: greyColor,),
                    //       SizedBox(height: height1,),
                    //       TextWidget(
                    //         text: "1. Diarrhea", fontSize: 18.sp,
                    //         fontWeight: FontWeight.w400, isTextCenter: false,
                    //         textColor: textColor, fontFamily: AppFonts.regular,),
                    //       TextWidget(
                    //         text: "2. Hypovolemia", fontSize: 18.sp,
                    //         fontWeight: FontWeight.w400, isTextCenter: false,
                    //         textColor: textColor, fontFamily: AppFonts.regular,),
                    //       TextWidget(
                    //         text: "3. Gastritis", fontSize: 18.sp,
                    //         fontWeight: FontWeight.w400, isTextCenter: false,
                    //         textColor: textColor, fontFamily: AppFonts.regular,),
                    //
                    //
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: height1,),
                    // TextWidget(
                    //   text: "Medication List", fontSize: 18.sp,
                    //   fontWeight: FontWeight.w600, isTextCenter: false,
                    //   textColor: textColor, fontFamily: AppFonts.semiBold,),
                    // SizedBox(height: height1,),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: bgColor,
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(color: greyColor)
                    //   ),
                    //   child: ListTile(
                    //     leading: SvgPicture.asset(AppIcons.radioOffIcon),
                    //     title: TextWidget(
                    //       text: "Tab Valsartan 80mg", fontSize: 16.sp,
                    //       fontWeight: FontWeight.w500, isTextCenter: false,
                    //       textColor: textColor, fontFamily: AppFonts.medium,),
                    //     subtitle: TextWidget(
                    //       text: "Dosage: 1 q.d - qAM", fontSize: 12.sp,
                    //       fontWeight: FontWeight.w400, isTextCenter: false,
                    //       textColor: textColor, fontFamily: AppFonts.regular,),
                    //   ),
                    // ),
                    // SizedBox(height: height1,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     TextWidget(
                    //       text: "Medication Reports", fontSize: 18.sp,
                    //       fontWeight: FontWeight.w600, isTextCenter: false,
                    //       textColor: textColor, fontFamily: AppFonts.semiBold,),
                    //     TextWidget(
                    //       text: "Donwload", fontSize: 14.sp,
                    //       fontWeight: FontWeight.w600, isTextCenter: false,
                    //       textColor: Color(0xff0596DE), fontFamily: AppFonts.semiBold,),
                    //   ],
                    // ),
                    // SizedBox(height: height1,),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: bgColor,
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: greyColor)
                    //   ),
                    //   child: ListTile(
                    //     title: TextWidget(
                    //       text: "Gastrectomy", fontSize: 16.sp,
                    //       fontWeight: FontWeight.w500, isTextCenter: false,
                    //       textColor: textColor, fontFamily: AppFonts.medium,),
                    //     subtitle: TextWidget(
                    //       text: "27 July 2024", fontSize: 12.sp,
                    //       fontWeight: FontWeight.w400, isTextCenter: false,
                    //       textColor: textColor, fontFamily: AppFonts.regular,),
                    //   ),
                    // ),
                    // SizedBox(height: height1,),
                    // SubmitButton(
                    //   title: "Check Reports",
                    //   press: () {
                    //
                    // },),
                    SizedBox(height: height1,),
                  ],
            ))
          ],
        ),
      ),
    );
  }
}
