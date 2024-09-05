import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/widgets/profile_tile.dart';

import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/dotted_line.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../../PatientScreens/EditProfileScreen/patient_edit_profile_screen.dart';
import '../../PatientScreens/NotificationSetting/notification_setting_screen.dart';
import '../../PatientScreens/UpComingAppointment/upcoming_appointment_screen.dart';
import '../../StartScreens/AccountTypeScreen/account_type_screen.dart';
import '../../StartScreens/LanguageScreen/language_screen.dart';
import '../../StartScreens/OnboardingScreen/onboarding_screen.dart';
import '../PaymentManagementScreen/payment_management_screen.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Profile"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(()=>PatientEditProfileScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: greyColor,
                                  shape: BoxShape.circle
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Column(
                              children: [
                                TextWidget(
                                  text: "Dr Fatima", fontSize: 20,
                                  fontWeight: FontWeight.w600, isTextCenter: false,
                                  textColor: bgColor, fontFamily: AppFonts.medium,
                                ),
                                SizedBox(height: 10,),
                                TextWidget(
                                    text: "+212611343456", fontSize: 16,
                                    fontWeight: FontWeight.w400, isTextCenter: false,
                                    textColor: bgColor
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: bgColor,
                                  shape: BoxShape.circle
                              ),
                              child: const Icon(Icons.edit_outlined,size: 20,color: themeColor,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ProfileTile(
                      title: "Personal Info",
                      icon: AppIcons.profileIcon,
                      iconBgColor: secondaryGreenColor,
                      iconColor: themeColor,
                      onTap: () {
                        Get.to(()=>PatientEditProfileScreen());
                    },),
                    ProfileTile(
                      title: "Notification",
                      icon: AppIcons.bellIcon,
                      iconBgColor: secondaryGreenColor,
                      iconColor: themeColor,
                      onTap: () {
                        Get.to(()=>NotificationSettingScreen());
                    },),
                    ProfileTile(
                      title: "Privacy ",
                      icon: AppIcons.privacyIcon,
                      iconBgColor: secondaryGreenColor,
                      iconColor: themeColor,
                      onTap: () {
                        // Get.to(()=>NotificationSettingScreen());
                      },),
                    ProfileTile(
                      title: "Payment management",
                      icon: AppIcons.walletIcon,
                      iconBgColor: secondaryGreenColor,
                      iconColor: themeColor,
                      onTap: () {
                        Get.to(()=>PaymentManagementScreen());
                      },),
                    ListTile(
                      onTap: () {
                        Get.to(()=>LanguageScreen(isNextButton: false,));
                      },
                      minTileHeight: 70,
                      title: const TextWidget(
                        text: "Language", fontSize: 18,
                        fontWeight: FontWeight.w600, isTextCenter: false,
                        textColor: textColor, fontFamily: AppFonts.semiBold,),
                      leading: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            color: secondaryGreenColor,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(AppIcons.languageIcon),
                      ),
                      trailing: const Icon(CupertinoIcons.forward,color: textColor,),
                    ),
                    ProfileTile(
                      title: "Logout",
                      icon: AppIcons.groupIcon,
                      iconBgColor: redColor.withOpacity(0.1),
                      iconColor: redColor,
                      onTap: () {
                        Get.bottomSheet(
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CustomPaint(
                                  size: Size(100.w, 45.h),
                                  painter: CurvedTopPainter(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const TextWidget(
                                        text: "Log Out", fontSize: 24,
                                        fontWeight: FontWeight.w600, isTextCenter: false,
                                        textColor: redColor, fontFamily: AppFonts.medium,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const DottedLine(
                                        color: greyColor,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const TextWidget(
                                        text: "Are you sure you want to log out", fontSize: 16,
                                        fontWeight: FontWeight.w400, isTextCenter: true,
                                        textColor: textColor, maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SubmitButton(
                                            width: 38.w,
                                            height: 50,
                                            title: "Cancel",
                                            textColor: themeColor,
                                            bgColor: bgColor,
                                            bdRadius: 6,
                                            press: () {
                                              Get.back();
                                            },
                                          ),
                                          SubmitButton(
                                            width: 38.w,
                                            height: 50,
                                            title: "Logout",
                                            bdRadius: 6,
                                            press: () {
                                              auth.signOut()
                                                  .whenComplete(() {
                                                Get.offAll(()=>OnboardingScreen());
                                              },);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                        },),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
