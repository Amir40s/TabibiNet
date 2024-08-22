import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Widgets/header.dart';

import '../../../Constants/app_fonts.dart';
import '../../../Constants/images_path.dart';
import '../../../Widgets/submit_button.dart';
import '../../../Widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Notification"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [

                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: greyColor,
                            width: 1.5
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),
                              height: 72,
                              width: 72,
                              decoration: const BoxDecoration(
                                color: themeColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(IconsPath.bellIcon,color: bgColor,),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const TextWidget(
                                  text: "Appointment Cancel!", fontSize: 16,
                                  fontWeight: FontWeight.w600, isTextCenter: false,
                                  textColor: textColor, fontFamily: AppFonts.semiBold,),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  width: 60.w,
                                  child: const TextWidget(
                                    text: "Never miss a medical appointment with our"
                                        " reliable appointment alarm system!", fontSize: 12,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: textColor, fontFamily: AppFonts.regular,maxLines: 4,),
                                ),
                                const SizedBox(height: 15,),
                                SubmitButton(
                                    width: 30.w,
                                    height: 40,
                                    title: "New",
                                    icon: Icons.arrow_forward_rounded,
                                    press: (){}
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            // Handle the central button action here
          },
          backgroundColor: themeColor,
          child: const Icon(Icons.arrow_downward_rounded,color: bgColor,size: 35,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
