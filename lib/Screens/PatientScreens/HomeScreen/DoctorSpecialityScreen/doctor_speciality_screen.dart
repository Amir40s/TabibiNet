import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/DoctorSpecialityScreen/Components/diagonistic_section.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/DoctorSpecialityScreen/Components/speciality_section.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

class DoctorSpecialityScreen extends StatelessWidget {
  const DoctorSpecialityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Doctor Speciality"),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SpecialitySection(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextWidget(
                    text: "Diagnostics & Tests", fontSize: 20,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor, fontFamily: AppFonts.semiBold,),
                ),
                const SizedBox(height: 20,),
                const DiagnosticSection(),
                const SizedBox(height: 20,),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
