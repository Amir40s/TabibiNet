import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/CheckInteractionScreen/check_interaction_screen.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

class EPrescriptionScreen extends StatelessWidget {
  const EPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "E-Prescriptions"),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  children: [
                    PrescriptionContainer(
                        text: "Check Interaction",
                        icon: AppIcons.checkInteractionIcon,
                        boxColor: Color(0xff45D0EE),
                        onTap: () {
                          Get.to(()=>CheckInteractionScreen());
                        },
                    ),
                    PrescriptionContainer(
                        text: "Calculate Dosage",
                        icon: AppIcons.calculateDosageIcon,
                        boxColor: Color(0xffF24C0F),
                        onTap: () {

                        },
                    ),
                    PrescriptionContainer(
                      text: "Prescribe Medicine",
                      icon: AppIcons.calculateDosageIcon,
                      boxColor: Color(0xffDEBA05),
                      onTap: () {

                      },
                    ),
                    PrescriptionContainer(
                      text: "Medication Lookup",
                      icon: AppIcons.calculateDosageIcon,
                      boxColor: Color(0xff0596DE),
                      onTap: () {

                      },
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

class PrescriptionContainer extends StatelessWidget {
  const PrescriptionContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.boxColor,
    required this.onTap,
  });

  final String text;
  final String icon;
  final Color boxColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 7.h,),
            const SizedBox(height: 10,),
            TextWidget(
              text: text, fontSize: 18.sp,
              fontWeight: FontWeight.w600, isTextCenter: true,
              textColor: bgColor, fontFamily: AppFonts.semiBold,maxLines: 2,)
          ],
        ),
      ),
    );
  }
}

