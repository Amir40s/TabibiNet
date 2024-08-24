import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/Components/schedule_section.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/Components/speciality_slider_section.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/DoctorDetailScreen/doctor_detail_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/DoctorSpecialityScreen/doctor_speciality_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/FindDoctorScreen/find_doctor_screen.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../Widgets/bottom_nav_bar.dart';
import 'package:intl/intl.dart';

import '../NotificationScreen/notification_screen.dart';
import 'Components/doctor_speciality_container.dart';
import 'Components/schedule_container.dart';
import 'Components/top_doctor_container.dart';
import 'FavoriteScreen/favorite_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  PatientHomeScreen({super.key});

  final CarouselSliderController _carouselController = CarouselSliderController();
  final searchC = TextEditingController();
  final List<String> scheduleData = ["Slide 1", "Slide 2", "Slide 3"]; // Replace with your actual data
  final List<Map<String, dynamic>> doctorSpecialityList = [
    {
      'title': "Ophthalmologist",
      'subTitle': '213 doctors',
      'icon': IconsPath.eyeIcon,
      'color': themeColor,
    },
    {
      'title': "Neurologist",
      'subTitle': '200 doctors',
      'icon': IconsPath.brainIcon,
      'color': bgColor,
    },
  ]; // Replace with your actual data

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: SizedBox(
                height: 72,
                child: Row(
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          color: greyColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: "HI, Nayeem!", fontSize: 20, fontWeight: FontWeight.w600, isTextCenter: false, textColor: textColor),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Row(
                            children: [
                              TextWidget(text: "Uttara", fontSize: 12, fontWeight: FontWeight.w400, isTextCenter: false, textColor: textColor),
                              Icon(Icons.location_on,color: themeColor,size: 20,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(()=>const NotificationScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: textColor,
                                width: 1.5
                            )
                        ),
                        child: SvgPicture.asset(IconsPath.bellIcon,height: 20,),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        Get.to(()=>FavoriteScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: textColor,
                                width: 1.5
                            )
                        ),
                        child: SvgPicture.asset(
                          IconsPath.favIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        TextWidget(
                            text: formattedTime, fontSize: 14,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
                        const SizedBox(height: 5,),
                        const TextWidget(
                          text: "Let’s Find Your Doctor", fontSize: 24,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        const SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            Get.to(()=>FindDoctorScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                width: 72.w,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: greyColor
                                  )
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.search,color: greyColor,size: 24,),
                                    SizedBox(width: 10,),
                                    TextWidget(
                                      text: 'Find here!', fontSize: 12,
                                      fontWeight: FontWeight.w400, isTextCenter: false,
                                      textColor: greyColor,fontFamily: AppFonts.regular,)
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: themeColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: SvgPicture.asset(IconsPath.menuIcon),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const TextWidget(
                          text: "Upcoming Schedule", fontSize: 20,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  ScheduleSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const TextWidget(
                          text: "Doctor Speciality", fontSize: 20,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(()=>DoctorSpecialityScreen());
                          },
                          child: const TextWidget(
                            text: "View All", fontSize: 14,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: themeColor, fontFamily: AppFonts.semiBold,),
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
                          text: "Top Doctor", fontSize: 20,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        Spacer(),
                        TextWidget(
                          text: "View All", fontSize: 14,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: themeColor, fontFamily: AppFonts.semiBold,),
                      ],
                    ),
                  ),
                  SizedBox(height: height1,),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                     return TopDoctorContainer(
                       onTap: () {
                         Get.to(()=>DoctorDetailScreen());
                       },
                     );
                    },
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            // Handle the central button action here
          },
          backgroundColor: themeColor,
          child: const Icon(Icons.add,color: bgColor,size: 35,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
