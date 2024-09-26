import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../Providers/FindDoctor/find_doctor_provider.dart';
import '../../../../constant.dart';
import '../../../../model/data/specialize_model.dart';
import '../../../../model/res/constant/app_icons.dart';
import 'doctor_speciality_container.dart';

class SpecialitySliderSection extends StatelessWidget {
  const SpecialitySliderSection({super.key});

  // final List<Map<String, dynamic>> doctorSpecialityList = [
  //   {
  //     'title': "Ophthalmologist",
  //     'subTitle': '213 doctors',
  //     'icon': AppIcons.eyeIcon,
  //     'color': themeColor,
  //   },
  //   {
  //     'title': "Neurologist",
  //     'subTitle': '200 doctors',
  //     'icon': AppIcons.brainIcon,
  //     'color': bgColor,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    final findDoctorP = Provider.of<FindDoctorProvider>(context, listen: false);
    return SizedBox(
      height: 78,
      width: 100.w,
      child: StreamBuilder<List<SpecializeModel>>(
        stream: findDoctorP.fetchSpeciality(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No specialities found'));
          }

          // List of users
          final specs = snapshot.data!;

          return Consumer<FindDoctorProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                padding: const EdgeInsets.only(left: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: specs.length,
                itemBuilder: (context, index) {
                  final spec = specs[index];
                  // final data = doctorSpecialityList[index];
                  return DoctorSpecialityContainer(
                    title: spec.specialty,
                    subTitle: "",
                    icon: AppIcons.brainIcon,
                    boxColor: bgColor,
                  );
                },);
            },);

        },),
    );
  }
}
