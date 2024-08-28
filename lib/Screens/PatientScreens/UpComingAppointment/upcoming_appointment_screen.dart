import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/PatientScreens/CancelAppointmentReason/cancel_appointment_reason_screen.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/dotted_line.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../constant.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class UpComingAppointment extends StatelessWidget {
  const UpComingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return MyAppointmentContainer(
              appointmentIcon: AppIcons.phone,
              doctorName: "Dr. Jenny Wilson",
              appointmentStatusText: "Upcoming",
              chatStatusText: "Voice Call",
              appointmentTimeText: "09-00 AM - 10-00 AM",
              ratingText: "4.9",
              leftButtonText: "Cancel",
              rightButtonText: "Start",
              statusTextColor: purpleColor,
              statusBoxColor: purpleColor.withOpacity(0.1),
              onTap: () {},
              leftButtonTap: () {
                Get.bottomSheet(
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CustomPaint(
                          size: Size(100.w, 60.h),
                          painter: CurvedTopPainter(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const TextWidget(
                            text: "Cancel Appointment", fontSize: 24,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: redColor, fontFamily: AppFonts.medium,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const DottedLine(
                            color: greyColor,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const TextWidget(
                            text: "Are you sure you want cancel\nthis appointment", fontSize: 16,
                            fontWeight: FontWeight.w400, isTextCenter: true,
                            textColor: textColor, maxLines: 2,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubmitButton(
                                width: 38.w,
                                height: 50,
                                title: "Back to Home",
                                textColor: themeColor,
                                bgColor: bgColor,
                                bdRadius: 6,
                                press: () {
                                  Get.back();
                                },
                              ),
                              SubmitButton(
                                width: 38.w,
                                height: 50,
                                title: "Yes Cancel",
                                bdRadius: 6,
                                press: () {
                                  Get.back();
                                  Get.to(()=>CancelAppointmentReasonScreen());
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                            ],
                          ),
                        ),
                  ],
                ));
              },
              rightButtonTap: () {},
            );
          },
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class CurvedTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    // Start the curve higher up by adjusting the first value
    path.moveTo(
        0,
        size.height *
            0.45); // Increase the 0.7 to 0.5 or lower to increase the height
    path.quadraticBezierTo(
      size.width / 2,
      size.height *
          0.2, // Set this to 0 to have the curve reach the top of the canvas
      size.width,
      size.height * 0.45, // Mirror the moveTo adjustment here
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

//Container(
//                     width: 100.w,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     decoration: const BoxDecoration(
//                       color: bgColor,
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(100))
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(height: 30,),
//                         const TextWidget(
//                           text: "Cancel Appointment", fontSize: 24,
//                           fontWeight: FontWeight.w600, isTextCenter: false,
//                           textColor: redColor, fontFamily: AppFonts.medium,
//                         ),
//                         const SizedBox(height: 30,),
//                         const DottedLine(color: greyColor,),
//                         const SizedBox(height: 30,),
//                         const TextWidget(
//                           text: "Are you sure you want to log out", fontSize: 16,
//                           fontWeight: FontWeight.w400, isTextCenter: false,
//                           textColor: textColor,
//                         ),
//                         const SizedBox(height: 30,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SubmitButton(
//                                 width: 38.w,
//                                 height: 50,
//                                 title: "",
//                                 textColor: themeColor,
//                                 bgColor: bgColor,
//                                 bdRadius: 6,
//                                 press: () {
//
//                                 },
//                             ),
//                             SubmitButton(
//                                 width: 38.w,
//                                 height: 50,
//                                 title: "",
//                                 bdRadius: 6,
//                                 press: () {
//
//                                 },
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20,),
//                       ],
//                     ),
//                   )
