import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/images_path.dart';

import '../../Constants/colors.dart';
import '../../Widgets/submit_button.dart';
import '../../Widgets/text_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Center(
                  child: TextWidget1(
                      text: "Choose Location", fontSize: 24,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor),
                ),
                SizedBox(height: 10,),
                Center(
                  child: TextWidget1(
                      text: "Choose your location for near hospitals", fontSize: 14,
                      fontWeight: FontWeight.w400, isTextCenter: false,
                      textColor: textColor),
                ),
                SizedBox(height: 20,),
                TextWidget2(
                    text: "Country", fontSize: 21,
                    fontWeight: FontWeight.w500, isTextCenter: false,
                    textColor: textColor),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 9.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: themeColor,
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget2(text: "Morroco", fontSize: 16, fontWeight: FontWeight.w600, isTextCenter: false, textColor: textColor),
                      Image.asset(IconsPath.downArrowIcon,width: 20,)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                TextWidget2(
                    text: "Address", fontSize: 21,
                    fontWeight: FontWeight.w500, isTextCenter: false,
                    textColor: textColor),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 9.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: themeColor,
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget2(
                          text: "House no 2, Street 3, Morocco Towers.",
                          fontSize: 16, fontWeight: FontWeight.w600,maxLines: 1,
                          isTextCenter: false, textColor: textColor),
                      Image.asset(IconsPath.radioIcon,height: 35,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100.w,
            height: 40.h,
            child: Image.asset(ImagesPath.googleMap,fit: BoxFit.cover,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SubmitButton(
              title: "Next",
              press: () {
                // Get.to(()=>LocationScreen());
              },),
          )
        ],
      ),
    );
  }
}
