import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../model/res/widgets/text_widget.dart';
import '../../../../model/res/constant/app_icons.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      height: 48.h,
      width: 100.w,
      decoration: const BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                text: "Dr. Dianne Johnson", fontSize: 20.sp,
                fontWeight: FontWeight.w600, isTextCenter: false,
                textColor: bgColor, fontFamily: AppFonts.semiBold,),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: const Icon(CupertinoIcons.suit_heart_fill,color: themeColor,size: 20,),
              ),
            ],
          ),
          TextWidget(
            text: "Gynecologist", fontSize: 16.sp,
            fontWeight: FontWeight.w400, isTextCenter: false,
            textColor: bgColor,),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: SvgPicture.asset(AppIcons.personIcon, height: 18.sp,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: "Patients", fontSize: 12.sp,
                      fontWeight: FontWeight.w400, isTextCenter: false,
                      textColor: bgColor),
                  TextWidget(
                    text: "500", fontSize: 12.sp,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: bgColor, fontFamily: AppFonts.semiBold,),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: SvgPicture.asset(AppIcons.groupIcon, height: 18.sp,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: "Years experience", fontSize: 12.sp,
                      fontWeight: FontWeight.w400, isTextCenter: false,
                      textColor: bgColor),
                  TextWidget(
                    text: "10+", fontSize: 12.sp,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: bgColor, fontFamily: AppFonts.semiBold,),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: SvgPicture.asset(AppIcons.msgIcon, height: 18.sp,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: "Reviews", fontSize: 12.sp,
                      fontWeight: FontWeight.w400, isTextCenter: false,
                      textColor: bgColor),
                  TextWidget(
                    text: "#60", fontSize: 12.sp,
                    fontWeight: FontWeight.w600, isTextCenter: false,
                    textColor: bgColor, fontFamily: AppFonts.semiBold,),
                ],
              )
            ],)
        ],
      ),
    );
  }
}
