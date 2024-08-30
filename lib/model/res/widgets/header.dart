import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

import '../../../constant.dart';
import '../constant/app_fonts.dart';


class Header extends StatelessWidget {
  const Header({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: SizedBox(
        height: 8.h,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: themeColor,
                    shape: BoxShape.circle
                ),
                child: const Center(child: Icon(CupertinoIcons.back,color: bgColor,size: 24,)),
              ),
            ),
            const SizedBox(width: 15,),
            TextWidget(
              text: text, fontSize: 24,
              fontWeight: FontWeight.w600, isTextCenter: false,
              textColor: textColor,fontFamily: AppFonts.semiBold,),
          ],
        ),
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  const Header2({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: SizedBox(
        height: 8.h,
        child: Row(
          children: [
            const SizedBox(width: 15,),
            TextWidget(
              text: text, fontSize: 24,
              fontWeight: FontWeight.w600, isTextCenter: false,
              textColor: textColor,fontFamily: AppFonts.semiBold,),
          ],
        ),
      ),
    );
  }
}
