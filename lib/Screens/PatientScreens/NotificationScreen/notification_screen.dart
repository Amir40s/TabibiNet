import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/PatientNotification/patient_notification_provider.dart';
import 'package:tabibinet_project/model/data/notification_model.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/dotted_line.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/text_widget.dart';
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
    final notificationP = Provider.of<PatientNotificationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Notification"),
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
                  StreamBuilder<List<NotificationModel>>(
                      stream: notificationP.fetchNotifications(),
                      builder: (context, snapshot) {

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No Notification found'));
                        }

                        // List of users
                        final nots = snapshot.data!;

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: nots.length,
                          itemBuilder: (context, index) {
                            final not = nots[index];
                            return NotificationContainer(
                                onTap: () {

                                },
                                title: not.title,
                                subTitle: not.subTitle,
                                image: AppIcons.calenderIcon,
                                iconColor: themeColor,
                                boxColor: secondaryGreenColor,
                                isButton: not.read == "false"
                            );
                          },);
                        },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//TextWidget(
//                     text: "Yesterday, April 19-2022", fontSize: 14,
//                     fontWeight: FontWeight.w600, isTextCenter: false,
//                     textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
//                   const SizedBox(height: 10,),
//NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Appointment Cancel!",
//                       subTitle: "Never miss a medical appointment with"
//                           " our reliable appointment alarm system!",
//                       image: AppIcons.cancelIcon,
//                       iconColor: themeColor,
//                       boxColor: secondaryGreenColor,
//                       isButton: false),
//                   NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Schedule Changed",
//                       subTitle: "Schedule Updated! Please check for "
//                           "changes in your appointments.",
//                       image: AppIcons.calenderIcon,
//                       iconColor: bgColor,
//                       boxColor: themeColor,
//                       isButton: false),
//                   TextWidget(
//                     text: "Yesterday, April 19-2022", fontSize: 14,
//                     fontWeight: FontWeight.w600, isTextCenter: false,
//                     textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
//                   const SizedBox(height: 10,),
//                   NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Appointment Cancel!",
//                       subTitle: "Never miss a medical appointment with"
//                           " our reliable appointment alarm system!",
//                       image: AppIcons.calenderIcon,
//                       iconColor: themeColor,
//                       boxColor: secondaryGreenColor,
//                       isButton: false),
//                   NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Schedule Changed",
//                       subTitle: "Schedule Updated! Please check for "
//                           "changes in your appointments.",
//                       image: AppIcons.bellIcon,
//                       iconColor: themeColor,
//                       boxColor: secondaryGreenColor,
//                       isButton: false),
//                   TextWidget(
//                     text: "February 22-2022", fontSize: 14,
//                     fontWeight: FontWeight.w600, isTextCenter: false,
//                     textColor: textColor.withOpacity(0.5), fontFamily: AppFonts.semiBold,),
//                   const SizedBox(height: 10,),
//                   NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Appointment Cancel!",
//                       subTitle: "Never miss a medical appointment with"
//                           " our reliable appointment alarm system!",
//                       image: AppIcons.calenderIcon,
//                       iconColor: themeColor,
//                       boxColor: secondaryGreenColor,
//                       isButton: false),
//                   NotificationContainer(
//                       onTap: () {
//
//                       },
//                       title: "Schedule Changed",
//                       subTitle: "Schedule Updated! Please check for "
//                           "changes in your appointments.",
//                       image: AppIcons.bellIcon,
//                       iconColor: themeColor,
//                       boxColor: secondaryGreenColor,
//                       isButton: false),