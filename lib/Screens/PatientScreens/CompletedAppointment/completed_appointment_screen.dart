import 'package:flutter/cupertino.dart';
import 'package:tabibinet_project/constant.dart';

import '../../../model/res/constant/app_icons.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class CompletedAppointmentScreen extends StatelessWidget {
  const CompletedAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      keyboardDismissBehavior:
      ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return MyAppointmentContainer(
              appointmentIcon: AppIcons.chat,
              doctorName: "Dr. Jenny Wilson",
              appointmentStatusText: "Accepted",
              chatStatusText: "Messaging",
              appointmentTimeText: "09-00 AM - 10-00 AM",
              ratingText: "4.9",
              leftButtonText: "Book Again",
              rightButtonText: "Leave a Review",
              statusTextColor: themeColor,
              statusBoxColor: secondaryGreenColor,
              onTap: () {

              },
              leftButtonTap: () {

              },
              rightButtonTap: () {

              },
            );
          },
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
