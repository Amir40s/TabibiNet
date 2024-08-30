import 'package:flutter/cupertino.dart';

import 'package:tabibinet_project/Screens/DoctorScreens/DoctorHomeScreen/Components/quick_access_container.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_icons.dart';

class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuickAccessContainer(
          text: 'Appointment\nReminders',
          boxColor: purpleColor,
          icon: AppIcons.docIcon,
        ),
        QuickAccessContainer(
          text: 'Teleconsultations',
          boxColor: lightRedColor,
          icon: AppIcons.patientIcon,
        ),
        QuickAccessContainer(
          text: 'DocShare',
          boxColor: themeColor,
          icon: AppIcons.docShareIcon,
        ),
      ],
    );
  }
}
