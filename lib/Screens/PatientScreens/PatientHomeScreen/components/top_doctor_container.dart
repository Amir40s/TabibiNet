import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/constant/app_icons.dart';
import '../../../../model/res/widgets/dotted_line.dart';
import '../../../../model/res/widgets/submit_button.dart';
import '../../../../model/res/widgets/text_widget.dart';

class TopDoctorContainer extends StatelessWidget {
  const TopDoctorContainer({
    super.key,
    this.onTap
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(13),
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      right: -7.5,
                      top: 5,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: bgColor,
                                width: 2
                            )
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35.w,
                      child: const TextWidget(
                        text: "Dr. Marvin McKinney", fontSize: 16,
                        fontWeight: FontWeight.w600, isTextCenter: false,maxLines: 2,
                        textColor: textColor, fontFamily: AppFonts.semiBold,),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                          child: const TextWidget(
                            text: "Cardiologist", fontSize: 14,
                            fontWeight: FontWeight.w400, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.regular,),
                        ),
                        const SizedBox(width: 5,),
                        const Icon(Icons.circle,color: textColor,size: 5,),
                        const SizedBox(width: 5,),
                        SizedBox(
                          width: 20.w,
                          child: const TextWidget(
                            text: "JFK Medical Center", fontSize: 12,
                            fontWeight: FontWeight.w400, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.regular,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,size: 20,),
                        TextWidget(
                          text: "4.9", fontSize: 12,
                          fontWeight: FontWeight.w400, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.regular,),
                        SizedBox(width: 5,),
                        Icon(Icons.circle,color: textColor,size: 5,),
                        SizedBox(width: 5,),
                        Icon(Icons.access_time_filled_rounded,color: themeColor, size: 20,),
                        SizedBox(width: 5,),
                        TextWidget(
                          text: "12pm-5pm", fontSize: 12,
                          fontWeight: FontWeight.w400, isTextCenter: false,
                          textColor: themeColor, fontFamily: AppFonts.regular,),

                      ],
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: greenColor
                      )
                  ),
                  child: SvgPicture.asset(AppIcons.favIcon),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubmitButton(
                    width: 30.w,
                    height: 40,
                    title: "Appointment",
                    press: (){}
                ),
                const SizedBox(width: 10,),
                const Expanded(
                    child: DottedLine(
                      color: greyColor,
                    )),
                const SizedBox(width: 10,),
                const TextWidget(
                  text: "\$40", fontSize: 18,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.semiBold,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
