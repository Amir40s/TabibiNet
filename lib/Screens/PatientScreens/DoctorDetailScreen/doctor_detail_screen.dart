import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import 'Components/about_section.dart';
import 'Components/info_section.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({
    super.key,
    required this.doctorName,
    required this.specialityName,
    required this.doctorDetail,
    required this.yearsOfExperience,
    required this.patients,
    required this.reviews,
  });

  final String doctorName;
  final String specialityName;
  final String doctorDetail;
  final String yearsOfExperience;
  final String patients;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryGreenColor,
        body: Column(
          children: [
            const Header(text: ""),
            Flexible(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  InfoSection(
                    doctorName: doctorName,
                    specialityName: specialityName,
                    yearsOfExperience: yearsOfExperience,
                    patients: patients,
                    reviews: reviews,
                  ),
                  AboutSection(
                    doctorDetail: doctorDetail,
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
