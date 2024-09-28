import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/MyAppointmentScreen/my_appointment_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/NotificationScreen/notification_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientHomeScreen/patient_home_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientMessageScreen/patient_message_screen.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientProfileScreen/patient_profile_screen.dart';

import '../../../Providers/BottomNav/bottom_navbar_provider.dart';
import '../../../constant.dart';
import '../../../model/res/widgets/bottom_nav_bar.dart';

class PatientBottomNavBar extends StatelessWidget {
  const PatientBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomP = Provider.of<BottomNavBarProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Consumer<BottomNavBarProvider>(
          builder: (context, value, child) {
          return IndexedStack(
            index: value.currentIndex,
            children: const [
              PatientHomeScreen(),
              ChatListScreen(),
              NotificationScreen(),
              PatientProfileScreen()
            ],
          );
        },),
        bottomNavigationBar: const CustomBottomNavBar(),
        floatingActionButton: FloatingActionButton(
          heroTag: "Home",
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            if(bottomP.currentIndex != 2){
              Get.to(()=>MyAppointmentScreen());
            }
          },
          backgroundColor: themeColor,
          child: Consumer<BottomNavBarProvider>(
            builder: (context, value, child) {
            return Icon(
              value.currentIndex == 2 ? Icons.arrow_downward_rounded :
            Icons.add,color: bgColor,size: 35,
            );
          },),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}