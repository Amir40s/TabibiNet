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
import 'package:tabibinet_project/Providers/UserHome/user_home_provider.dart';
import 'package:tabibinet_project/Screens/UserScreens/HomeScreen/Components/doctor_speciality_container.dart';
import 'package:tabibinet_project/Screens/UserScreens/HomeScreen/Components/schedule_container.dart';
import 'package:tabibinet_project/Screens/UserScreens/HomeScreen/Components/top_doctor_container.dart';
import 'package:tabibinet_project/Screens/UserScreens/HomeScreen/FavoriteScreen/favorite_screen.dart';
import 'package:tabibinet_project/Screens/UserScreens/NotificationScreen/notification_screen.dart';
import 'package:tabibinet_project/Widgets/input_field.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../../Widgets/bottom_nav_bar.dart';
import 'package:intl/intl.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

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
                              color: lightGreenColor.withOpacity(0.3),
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
                        Get.to(()=>NotificationScreen());
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 75.w,
                                height: 50,
                                child: InputField(
                                  inputController: searchC,
                                  hintText: "Find here!",
                                  prefixIcon: Icons.search,
                                )),
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
                        const SizedBox(height: 20,),
                        const TextWidget(
                          text: "Upcoming Schedule", fontSize: 20,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  CarouselSlider(
                      items: scheduleData.map((data) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ScheduleContainer();
                          },
                        );
                      }).toList(),
                    carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 15.h,
                        initialPage: 0,
                        viewportFraction: 0.85,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          Provider.of<UserHomeProvider>(context,listen: false).setIndex(index);
                        },
                      ),
                  ),
                  const SizedBox(height: 16.0),
                  Consumer<UserHomeProvider>(builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: scheduleData.map((data) {
                        int index = scheduleData.indexOf(data);
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                          height: 6.0,
                          width: value.currentIndex == index ? 25.0 : 6.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: value.currentIndex == index
                                ? themeColor
                                : greyColor,
                          ),
                        );
                      }).toList(),
                    );
                  },),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        TextWidget(
                          text: "Doctor Speciality", fontSize: 20,
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
                  SizedBox(
                    height: 78,
                    width: 100.w,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: doctorSpecialityList.length,
                      itemBuilder: (context, index) {
                        final data = doctorSpecialityList[index];
                      return DoctorSpecialityContainer(
                          title: data["title"]!,
                          subTitle: data["subTitle"]!,
                          icon: data["icon"]!,
                          boxColor: data["color"]!,
                      );
                    },),
                  ),
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
                     return const TopDoctorContainer();
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
