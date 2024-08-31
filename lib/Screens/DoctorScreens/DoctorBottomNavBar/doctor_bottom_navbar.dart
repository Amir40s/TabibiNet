import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorAppointmentSchedule/doctor_appointment_schedule_screen.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/doctor_home_screen.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/PatientManagementScreen/patient_management_screen.dart';
import 'package:tabibinet_project/constant.dart';

import '../../../Providers/BottomNav/bottom_navbar_provider.dart';
import '../../../model/res/widgets/bottom_nav_bar.dart';

class DoctorBottomNavbar extends StatelessWidget {
  const DoctorBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomP = Provider.of<BottomNavBarProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Consumer<BottomNavBarProvider>(
          builder: (context, value, child) {
            return IndexedStack(
              index: value.currentIndex,
              children: [
                const DoctorHomeScreen(),
                DoctorAppointmentSchedule(),
                const PatientManagementScreen(),
                const Center(child: Text("document"),)
              ],
            );
          },),
        bottomNavigationBar: const CustomBottomNavBar2(),
      ),
    );
  }
}
