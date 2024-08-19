import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/Onboard/onboard_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/LanguageScreen/language_screen.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../Constants/colors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<Map<String, String>> onboardingData = [
    {
      'text1': "Expert Doctor",
      'text2': ' Advice\nOnline',
      'text3': 'Access professional medical guidance conveniently from the comfort of your home.',
    },
    {
      'text1': "Doctor Support,\nAlways",
      'text2': ' Ready',
      'text3': 'Access reliable medical assistance whenever you need it, from trusted professionals.',
    },
    {
      'text1': "Stay Healthy,",
      'text2': ' Stay\nConnected',
      'text3': 'Stay connected to health resources for a healthier, more informed lifestyle.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 47.w,
                    height: 100.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      );
                    },),
                  ),
                  SizedBox(
                    width: 47.w,
                    height: 100.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      );
                    },),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width: 100.w,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))
              ),
              child: Consumer<OnboardProvider>(builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 7,
                      width: 60,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: RichText(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: onboardingData[value.currentIndex]['text1']!,
                              style: TextStyle(color: textColor, fontSize: 30,
                                  fontFamily: "Regular",fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                  text: onboardingData[value.currentIndex]['text2']!,
                                  style: TextStyle(color: themeColor, fontSize: 30,
                                      fontFamily: "Regular",fontWeight: FontWeight.w600),),
                              ]
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: TextWidget1(
                        text: onboardingData[value.currentIndex]['text3']!,
                        fontSize: 16, fontWeight: FontWeight.normal,
                        isTextCenter: true, textColor: textColor,maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: onboardingData.map((data) {
                        int index = onboardingData.indexOf(data);
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                          height: 6.0,
                          width: value.currentIndex == index ? 25.0 : 6.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: value.currentIndex == index
                                ? themeColor
                                : greyColor,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(()=>LanguageScreen());
                          },
                          child: TextWidget2(
                              text: "Skip", fontSize: 14,
                              fontWeight: FontWeight.normal, isTextCenter: false, textColor: themeColor),
                        ),
                        InkWell(
                          onTap: () {
                            if(value.currentIndex < 2){
                              value.setCurrentIndex();
                            }else{
                              Get.to(()=>LanguageScreen());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: themeColor,
                                shape: BoxShape.circle
                            ),
                            child: Icon(
                              CupertinoIcons.forward,
                              color: bgColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
