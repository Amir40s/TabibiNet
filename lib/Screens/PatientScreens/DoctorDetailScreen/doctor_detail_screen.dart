import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import 'Components/about_section.dart';
import 'Components/info_section.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

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
                  InfoSection(),
                  AboutSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
