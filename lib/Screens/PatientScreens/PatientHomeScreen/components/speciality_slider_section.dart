import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_icons.dart';
import 'doctor_speciality_container.dart';

class SpecialitySliderSection extends StatelessWidget {
  SpecialitySliderSection({super.key});

  final List<Map<String, dynamic>> doctorSpecialityList = [
    {
      'title': "Ophthalmologist",
      'subTitle': '213 doctors',
      'icon': AppIcons.eyeIcon,
      'color': themeColor,
    },
    {
      'title': "Neurologist",
      'subTitle': '200 doctors',
      'icon': AppIcons.brainIcon,
      'color': bgColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
