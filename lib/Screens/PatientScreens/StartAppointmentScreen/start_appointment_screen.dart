import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/PatientHome/patient_home_provider.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../AppointmentScheduleScreen/Components/fee_container.dart';
import '../VoiceCallScreen/appointment_voice_call_screen.dart';

class StartAppointmentScreen extends StatelessWidget {
  StartAppointmentScreen({super.key});

  final timeC = TextEditingController();

  final List<String> _dropdownItems = ['Consultancy', 'Video Call', 'Help Center '];

  @override
  Widget build(BuildContext context) {

    double height1 = 20;
    double height2 = 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Start Appointment"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  SizedBox(height: height1,),
                  Center(
                      child: SvgPicture.asset(AppIcons.notificationIcon)
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "You have received an Appointment Invitation From DR FATIMA", fontSize: 20,
                    fontWeight: FontWeight.w600, isTextCenter: true, maxLines: 2,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  const SizedBox(height: 40,),
                  const TextWidget(
                    text: "Appointment Information", fontSize: 20,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "Appointment Time", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  Container(
                    width: 100.w,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: themeColor
                      )
                    ),
                    child: const TextWidget(
                      text: "12:00 ", fontSize: 16,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                  ),
                  SizedBox(height: height1,),
                  const TextWidget(
                    text: "Consultation Type", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                  SizedBox(height: height2,),
                  Container(
                    width: 100.w,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: themeColor
                      )
                    ),
                    child: Consumer<PatientHomeProvider>(
                      builder: (context, provider, child) {
                      return DropdownButton<String>(
                        dropdownColor: bgColor,
                        icon: const Icon(CupertinoIcons.chevron_down,size: 15,),
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(15),
                        hint: const TextWidget(
                          text: "All", fontSize: 16,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor,fontFamily: AppFonts.semiBold,),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.semiBold,
                            fontWeight: FontWeight.w600,
                            color: textColor
                        ),
                        isExpanded: true,
                        value: provider.selectedAppointmentType,
                        onChanged: (newValue) {
                          provider.setAppointmentType(newValue!);
                        },
                        items: _dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      );
                    },),
                  ),
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
              Get.to(()=> const AppointmentVoiceCallScreen());
            },),
        ),
      ),
    );
  }
}


//SizedBox(height: height1,),
//                   const FeeContainer(),
//                   SizedBox(height: height1,),
//                   const FeeContainer(),
//                   SizedBox(height: height1,),
//                   const FeeContainer(),