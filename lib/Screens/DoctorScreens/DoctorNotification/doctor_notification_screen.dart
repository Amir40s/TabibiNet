import 'package:flutter/material.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/DoctorNotification/Components/doctor_notification_tile.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_icons.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

class DoctorNotificationScreen extends StatelessWidget {
  const DoctorNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Notifications"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(height: height,),
                  const DoctorNotificationTile(
                      title: "Upcoming Event",
                      subTitle: "Tabibinet is organizing an event for all medicine practitioners",
                      timeText: "10 min ago",
                      icon: AppIcons.upcomingEventIcon,
                      iconBgColor: Color(0xffFFECCC)
                  ),
                  SizedBox(height: height,),
                  const DoctorNotificationTile(
                      title: "Upcoming Appointment",
                      subTitle: "You have a patient to attend in half an hour",
                      timeText: "10 min ago",
                      icon: AppIcons.upcomingAppointmentIcon,
                      iconBgColor: Color(0xffF3EAFF)
                  ),
                  SizedBox(height: height,),
                  const DoctorNotificationTile(
                      title: "New Message",
                      subTitle: "You have a unread message from Mike Brown",
                      timeText: "1hr ago",
                      icon: AppIcons.newMessageIcon,
                      iconBgColor: Color(0xffE2F8E3)
                  ),
                  SizedBox(height: height,),
                  const DoctorNotificationTile(
                      title: "Add your availability",
                      subTitle: "It seems like you have not added your availability yet.",
                      timeText: "5hrs ago",
                      icon: AppIcons.availabilityIcon,
                      iconBgColor: Color(0xffE1F3FF)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
