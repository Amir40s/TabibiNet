import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/CodeGenerationScreen/code_generation_screen.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../MakePaymentScreen/Components/payment_detail_section.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height1 = 20.0;
    double height2 = 10.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Make Payment"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: height1),
                    const PaymentDetailSection(),
                    SizedBox(height: height1),
                    const TextWidget(
                      text: "Payment Methods", fontSize: 20,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height1),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: themeColor
                        )
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsPath.payment_1,
                          ),
                          SizedBox(width: height2,),
                          const TextWidget(
                              text: "Credit / Debit Card", fontSize: 16,
                              fontWeight: FontWeight.w400, isTextCenter: false,
                              textColor: textColor),
                          const Spacer(),
                          SvgPicture.asset(
                            IconsPath.radioOffIcon,
                            colorFilter: const ColorFilter.mode(themeColor, BlendMode.srcIn),)
                        ],
                      ),
                    ),
                    SizedBox(height: height1),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: themeColor
                          )
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsPath.payment_1,
                          ),
                          SizedBox(width: height2,),
                          const TextWidget(
                              text: "Pay Through Payment Code", fontSize: 16,
                              fontWeight: FontWeight.w400, isTextCenter: false,
                              textColor: textColor),
                          const Spacer(),
                          SvgPicture.asset(
                            IconsPath.radioOnIcon,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height1),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: themeColor
                          )
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsPath.payment_2,
                          ),
                          SizedBox(width: height2,),
                          const TextWidget(
                              text: "Bank Account", fontSize: 16,
                              fontWeight: FontWeight.w400, isTextCenter: false,
                              textColor: textColor),
                          const Spacer(),
                          SvgPicture.asset(
                            IconsPath.radioOffIcon,
                            colorFilter: const ColorFilter.mode(themeColor, BlendMode.srcIn),)
                        ],
                      ),
                    ),
                    SizedBox(height: height1),
                    Container(
                      width: 100.w,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: greyColor
                          )
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: themeColor,
                              shape: BoxShape.circle
                            ),
                            child: const Icon(Icons.add_rounded,color: bgColor,),
                          ),
                          SizedBox(height: height2,),
                          const TextWidget(
                              text: "Add Card", fontSize: 16,
                              fontWeight: FontWeight.w400, isTextCenter: false,
                              textColor: themeColor, fontFamily: AppFonts.semiBold,),
                        ],
                      ),
                    ),
                    SizedBox(height: height1),
                    SubmitButton(
                      title: "Confirm Appoinment",
                      press: () {
                        Get.to(()=>CodeGenerationScreen());
                    },),
                    SizedBox(height: height1),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
