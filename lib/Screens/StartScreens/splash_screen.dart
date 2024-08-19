import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagesPath.splashImage,height: 30.h,),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                height: 7,
                width: 14,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
