import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/widgets/text_widget.dart';

class PrescriptionContainer extends StatelessWidget {
  const PrescriptionContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.boxColor,
    required this.onTap,
  });

  final String text;
  final String icon;
  final Color boxColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 7.h,),
            const SizedBox(height: 10,),
            TextWidget(
              text: text, fontSize: 18.sp,
              fontWeight: FontWeight.w600, isTextCenter: true,
              textColor: bgColor, fontFamily: AppFonts.semiBold,maxLines: 2,)
          ],
        ),
      ),
    );
  }
}