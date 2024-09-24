import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/MyAppointment/my_appointment_provider.dart';
import 'package:tabibinet_project/model/data/appointment_model.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/curved_top_painter.dart';
import '../../../model/res/widgets/dotted_line.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../CancelAppointmentReason/cancel_appointment_reason_screen.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class UpComingAppointment extends StatelessWidget {
  const UpComingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppP = Provider.of<MyAppointmentProvider>(context,listen: false);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<List<AppointmentModel>>(
          stream: myAppP.fetchMyAppointment("upcoming"),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No appointment found'));
            }

            final appoints = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appoints.length,
              itemBuilder: (context, index) {
                final appoint = appoints[index];
                return MyAppointmentContainer(
                  appointmentIcon: AppIcons.phone,
                  doctorName: appoint.doctorName,
                  appointmentStatusText: "Upcoming",
                  chatStatusText: appoint.feesType,
                  image: appoint.image,
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
            );
          },),
        const SizedBox(
          height: 30,
        )
      ],
    );
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
