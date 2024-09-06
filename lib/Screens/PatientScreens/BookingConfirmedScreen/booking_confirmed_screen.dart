import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/PatientAppointment/patient_appointment_provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/StartAppointmentScreen/start_appointment_screen.dart';
import 'package:tabibinet_project/model/res/components/circle_icon.dart';
import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/widgets/dotted_line.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/submit_button.dart';
import '../../../../model/res/widgets/text_widget.dart';
import '../DoctorDetailScreen/doctor_detail_screen.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentP = Provider.of<PatientAppointmentProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryGreenColor,
        body: Column(
          children: [
            const Header(text: ""),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      SizedBox(
                        height: 86.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 100.w,
                              child: Column(
                                children: [
                                  const CircleIcon(icon: Icons.done_rounded),
                                  SizedBox(height: 20.sp,),
                                  const TextWidget(
                                      text: "Booking Confirmed",
                                      fontSize: 24, fontWeight: FontWeight.w600,
                                      isTextCenter: false, textColor: textColor),
                                  const TextWidget(
                                      text: "Dr. Jenny Wilson is a highly skilled cardiologist"
                                          " dedicated to providing exceptional cardiac care. With ",
                                      fontSize: 12, fontWeight: FontWeight.w400,
                                      isTextCenter: true, textColor: textColor,maxLines: 2,),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(35))
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey,blurRadius: 1)
                                ]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const TextWidget(
                                          text: "ID : 656352165",
                                          fontSize: 14, fontWeight: FontWeight.w400,
                                          isTextCenter: false, textColor: textColor),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: bgColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: greyColor)
                                        ),
                                        child: Icon(Icons.edit,color: Colors.grey,size: 18.sp,),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(13),
                                        height: 72,
                                        width: 72,
                                        decoration: BoxDecoration(
                                          color: greyColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 35.w,
                                            child: const TextWidget(
                                              text: "Dr. Jenny Wilson", fontSize: 16,
                                              fontWeight: FontWeight.w600, isTextCenter: false,maxLines: 2,
                                              textColor: textColor, fontFamily: AppFonts.semiBold,),
                                          ),
                                          const SizedBox(height: 10,),
                                          SizedBox(
                                            width: 35.w,
                                            child: const TextWidget(
                                              text: "Online", fontSize: 14,
                                              fontWeight: FontWeight.w400, isTextCenter: false,
                                              textColor: textColor, fontFamily: AppFonts.regular,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  const DottedLine(color: greyColor,),
                                  const SizedBox(height: 20,),
                                  SizedBox(
                                    height: 25.sp,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: "Name :",
                                          fontSize: 12, fontWeight: FontWeight.w400,
                                          isTextCenter: false, textColor: textColor,maxLines: 1,),
                                        TextWidget(
                                            text: "Dr. Jenny Wilson", fontFamily: AppFonts.semiBold,
                                            fontSize: 12, fontWeight: FontWeight.w600,
                                            isTextCenter: false, textColor: textColor),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.sp,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: "Time :",
                                          fontSize: 12, fontWeight: FontWeight.w400,
                                          isTextCenter: false, textColor: textColor,maxLines: 1,),
                                        TextWidget(
                                            text: "11.30 AM", fontFamily: AppFonts.semiBold,
                                            fontSize: 12, fontWeight: FontWeight.w600,
                                            isTextCenter: false, textColor: textColor),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.sp,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: "Date :",
                                          fontSize: 12, fontWeight: FontWeight.w400,
                                          isTextCenter: false, textColor: textColor,maxLines: 1,),
                                        TextWidget(
                                            text: "20/02/2024", fontFamily: AppFonts.semiBold,
                                            fontSize: 12, fontWeight: FontWeight.w600,
                                            isTextCenter: false, textColor: textColor),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.sp,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: "Total",
                                          fontSize: 12, fontWeight: FontWeight.w400,
                                          isTextCenter: false, textColor: textColor,maxLines: 1,),
                                        TextWidget(
                                            text: "\$85.00", fontFamily: AppFonts.semiBold,
                                            fontSize: 12, fontWeight: FontWeight.w600,
                                            isTextCenter: false, textColor: themeColor),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            SubmitButton(
                              title: "Done",
                              press: () async {
                                await appointmentP.addPatient();
                            },),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
