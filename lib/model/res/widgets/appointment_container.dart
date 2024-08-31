import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../constant.dart';
import '../constant/app_fonts.dart';

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({
    super.key,
    required this.statusText,
    required this.text1,
    required this.text2,
    required this.statusTextColor,
    required this.boxColor,
    this.onTap,
  });

  final String statusText;
  final String text1;
  final String text2;
  final Color boxColor;
  final Color statusTextColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? (){},
      child: Container(
        width: 100.w,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: greyColor
            )
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Micheal Rickliff", fontSize: 16.sp,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.semiBold,),
                TextWidget(
                  text: "Phone Number: +23883884", fontSize: 12.sp,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.regular,),
                TextWidget(
                  text: "Age: 22", fontSize: 12.sp,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.regular,),
                TextWidget(
                  text: "Gender: Male", fontSize: 12.sp,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.regular,),
                TextWidget(
                  text: "Complaint: Heart Burn", fontSize: 12.sp,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.regular,),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: text1, fontSize: 12.sp,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.regular,),
                TextWidget(
                  text: text2, fontSize: 16.sp,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.semiBold,),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextWidget(
                    text: statusText, fontSize: 16,
                    fontWeight: FontWeight.w500, isTextCenter: false,
                    textColor: statusTextColor, fontFamily: AppFonts.medium,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
