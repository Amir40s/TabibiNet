import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/model/data/appointment_model.dart';

import '../../../Providers/MyAppointment/my_appointment_provider.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../MyAppointmentScreen/Components/my_appointment_container.dart';

class CancelAppointmentScreen extends StatelessWidget {
  const CancelAppointmentScreen({super.key});

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
        StreamBuilder<List<AppointmentModel>>(
          stream: myAppP.fetchMyAppointment("cancelled"),
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
                  appointmentIcon: AppIcons.video,
                  doctorName: appoint.doctorName,
                  image: appoint.image,
                  appointmentStatusText: "Decline",
                  chatStatusText: appoint.feesType,
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
            );
          },),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
