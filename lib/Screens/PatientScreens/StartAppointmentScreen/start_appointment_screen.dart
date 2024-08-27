import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../AppointmentScheduleScreen/Components/fee_container.dart';
import '../VoiceCallScreen/appointment_voice_call_screen.dart';

class StartAppointmentScreen extends StatelessWidget {
  const StartAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height1 = 20;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Start Appointment"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SubmitButton(
            title: "Continue",
            press: () {
              Get.to(()=> AppointmentVoiceCallScreen());
            },),
        ),
      ),
    );
  }
}
