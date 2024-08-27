import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../model/res/widgets/submit_button.dart';
import '../../../../../model/res/widgets/text_widget.dart';
import '../../../../model/res/constant/app_icons.dart';

class FeeContainer extends StatelessWidget {
  const FeeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: themeColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.radioOnIcon,height: 17.sp,),
          const SizedBox(width: 20,),
          SizedBox(
            width: 40.w,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Consultancy", fontSize: 16,
                  fontWeight: FontWeight.w500, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.medium,),
                TextWidget(
                  text: "Book a free consultancy", fontSize: 12,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor,maxLines: 2,),
              ],
            ),
          ),
          const SizedBox(width: 20,),
          SubmitButton(
            title: "120 MAD",
            bgColor: secondaryGreenColor,
            height: 50,
            width: 25.w,
            bdColor: secondaryGreenColor,
            textColor: themeColor,
            textSize: 16.sp,
            press: () {

            },)
        ],
      ),
    );
  }
}
