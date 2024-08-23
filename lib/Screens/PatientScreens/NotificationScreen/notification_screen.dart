import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Widgets/header.dart';

import '../../../Constants/app_fonts.dart';
import '../../../Constants/images_path.dart';
import '../../../Widgets/dotted_line.dart';
import '../../../Widgets/text_widget.dart';
import 'Components/notification_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _selectedItem;

  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

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
                   Row(
                    children: [
                      const TextWidget(
                        text: "Latest Update", fontSize: 20,
                        fontWeight: FontWeight.w600, isTextCenter: false,
                        textColor: textColor, fontFamily: AppFonts.semiBold,),
                      const Spacer(),
                      const TextWidget(
                        text: "Short By :", fontSize: 12,
                        fontWeight: FontWeight.w400, isTextCenter: false,
                        textColor: textColor, fontFamily: AppFonts.regular,),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: greyColor
                          )
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: bgColor,
                          icon: const Icon(CupertinoIcons.chevron_down,size: 15,),
                          borderRadius: BorderRadius.circular(8),
                          underline: const SizedBox(),
                          hint: const TextWidget(
                            text: "All", fontSize: 12,
                            fontWeight: FontWeight.w400, isTextCenter: false,
                            textColor: textColor,fontFamily: AppFonts.regular,),
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.regular,
                            fontWeight: FontWeight.w400,
                            color: textColor
                          ),
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          items: _dropdownItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const DottedLine(
                    height: 2,
                    color: greyColor,
                    dotLength: 4,
                    spacing: 4,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 20,),
                  TextWidget(
                    text: "Yesterday, April 19-2022", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
                  const SizedBox(height: 10,),
                  const NotificationContainer(
                      title: "Appointment Cancel!",
                      subTitle: "Never miss a medical appointment with"
                          " our reliable appointment alarm system!",
                      image: IconsPath.cancelIcon,
                      iconColor: themeColor,
                      boxColor: secondaryGreenColor,
                      isButton: false),
                  const NotificationContainer(
                      title: "Schedule Changed",
                      subTitle: "Schedule Updated! Please check for "
                          "changes in your appointments.",
                      image: IconsPath.calenderIcon,
                      iconColor: bgColor,
                      boxColor: themeColor,
                      isButton: true),
                  TextWidget(
                    text: "Yesterday, April 19-2022", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
                  const SizedBox(height: 10,),
                  const NotificationContainer(
                      title: "Appointment Cancel!",
                      subTitle: "Never miss a medical appointment with"
                          " our reliable appointment alarm system!",
                      image: IconsPath.calenderIcon,
                      iconColor: themeColor,
                      boxColor: secondaryGreenColor,
                      isButton: false),
                  const NotificationContainer(
                      title: "Schedule Changed",
                      subTitle: "Schedule Updated! Please check for "
                          "changes in your appointments.",
                      image: IconsPath.bellIcon,
                      iconColor: themeColor,
                      boxColor: secondaryGreenColor,
                      isButton: false),
                  TextWidget(
                    text: "February 22-2022", fontSize: 14,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
                  const SizedBox(height: 10,),
                  const NotificationContainer(
                      title: "Appointment Cancel!",
                      subTitle: "Never miss a medical appointment with"
                          " our reliable appointment alarm system!",
                      image: IconsPath.calenderIcon,
                      iconColor: themeColor,
                      boxColor: secondaryGreenColor,
                      isButton: false),
                  const NotificationContainer(
                      title: "Schedule Changed",
                      subTitle: "Schedule Updated! Please check for "
                          "changes in your appointments.",
                      image: IconsPath.bellIcon,
                      iconColor: themeColor,
                      boxColor: secondaryGreenColor,
                      isButton: false),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "Notification",
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
