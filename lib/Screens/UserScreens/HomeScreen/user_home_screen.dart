import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: SizedBox(
                height: 72,
                child: Row(
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          color: greyColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: "HI, Nayeem!", fontSize: 20, fontWeight: FontWeight.w600, isTextCenter: false, textColor: textColor),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          decoration: BoxDecoration(
                              color: lightGreenColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Row(
                            children: [
                              TextWidget(text: "Uttara", fontSize: 12, fontWeight: FontWeight.w400, isTextCenter: false, textColor: textColor),
                              Icon(Icons.location_on,color: themeColor,size: 20,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: textColor,
                              width: 1.5
                          )
                      ),
                      child: SvgPicture.asset(IconsPath.bellIcon,height: 20,),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: textColor,
                              width: 1.5
                          )
                      ),
                      child: SvgPicture.asset(IconsPath.favIcon),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
