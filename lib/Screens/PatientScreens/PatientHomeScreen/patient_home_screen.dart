import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/PatientAppointment/patient_appointment_provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientHomeScreen/components/doctor_section.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';

import '../../../constant.dart';
import '../../../model/data/user_model.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/bottom_nav_bar.dart';
import 'package:intl/intl.dart';

import '../../../model/res/widgets/text_widget.dart';
import '../DoctorDetailScreen/doctor_detail_screen.dart';
import '../DoctorSpecialityScreen/doctor_speciality_screen.dart';
import '../FavoriteScreen/favorite_screen.dart';
import '../FindDoctorScreen/find_doctor_screen.dart';
import '../NotificationScreen/notification_screen.dart';
import 'components/patient_home_header.dart';
import 'components/schedule_section.dart';
import 'components/speciality_slider_section.dart';
import 'components/top_doctor_container.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
    DateTime now = DateTime.now();
    // Format the time using intl
    String formattedTime = DateFormat('EEEE, MMMM d').format(now);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PatientHomeHeader(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          text: formattedTime,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: textColor.withOpacity(0.5),
                          fontFamily: AppFonts.semiBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextWidget(
                          text: "Let’s Find Your Doctor",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: textColor,
                          fontFamily: AppFonts.semiBold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => FindDoctorScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                width: 72.w,
                                decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: greyColor)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: greyColor,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: 'Find here!',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      isTextCenter: false,
                                      textColor: greyColor,
                                      fontFamily: AppFonts.regular,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: themeColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: SvgPicture.asset(AppIcons.menuIcon),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextWidget(
                          text: "Upcoming Schedule",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: textColor,
                          fontFamily: AppFonts.semiBold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ScheduleSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const TextWidget(
                          text: "Doctor Speciality",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: textColor,
                          fontFamily: AppFonts.semiBold,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(() => const DoctorSpecialityScreen());
                          },
                          child: const TextWidget(
                            text: "View All",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            isTextCenter: false,
                            textColor: themeColor,
                            fontFamily: AppFonts.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height1,),
                  SpecialitySliderSection(),
                  SizedBox(height: height1,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        TextWidget(
                          text: "Top Doctor",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: textColor,
                          fontFamily: AppFonts.semiBold,
                        ),
                        Spacer(),
                        TextWidget(
                          text: "View All",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          isTextCenter: false,
                          textColor: themeColor,
                          fontFamily: AppFonts.semiBold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height1,),
                  const DoctorSection(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
