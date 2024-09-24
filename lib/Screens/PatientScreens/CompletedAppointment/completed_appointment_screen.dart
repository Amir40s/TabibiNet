import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/constant.dart';

import '../../../Providers/MyAppointment/my_appointment_provider.dart';
import '../../../model/res/constant/app_icons.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class CompletedAppointmentScreen extends StatelessWidget {
  const CompletedAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppP = Provider.of<MyAppointmentProvider>(context,listen: false);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      keyboardDismissBehavior:
      ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: myAppP.fetchMyAppointment("completed"),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No appointment found'));
              }

              final appoints = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appoints.length,
                itemBuilder: (context, index) {
                  final appoint = appoints[index];
                  return MyAppointmentContainer(
                    appointmentIcon: AppIcons.chat,
                    doctorName: appoint.doctorName,
                    appointmentStatusText: "Accepted",
                    chatStatusText: appoint.feesType,
                    image: appoint.image,
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
