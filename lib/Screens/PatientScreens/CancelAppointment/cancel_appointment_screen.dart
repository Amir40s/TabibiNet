import 'package:flutter/cupertino.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class CancelAppointmentScreen extends StatelessWidget {
  const CancelAppointmentScreen({super.key});

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
              appointmentIcon: AppIcons.video,
              doctorName: "Dr. Jenny Wilson",
              appointmentStatusText: "Decline",
              chatStatusText: "Video Call",
              appointmentTimeText: "09-00 AM - 10-00 AM",
              ratingText: "4.9",
              leftButtonText: "Book Again",
              rightButtonText: "Leave a Review",
              statusTextColor: redColor,
              statusBoxColor: redColor.withOpacity(0.1),
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
