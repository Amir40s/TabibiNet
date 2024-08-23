import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Widgets/header.dart';

import '../../../../Constants/images_path.dart';
import '../../../../Widgets/input_field.dart';
import '../Components/top_doctor_container.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "My Favourite Doctor"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 75.w,
                          height: 50,
                          child: InputField(
                            inputController: searchC,
                            hintText: "Find here!",
                            prefixIcon: Icons.search,
                          )),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SvgPicture.asset(IconsPath.menuIcon),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TopDoctorContainer();
                    },
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
