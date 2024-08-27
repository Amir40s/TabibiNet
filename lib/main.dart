import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/Location/location_provider.dart';
import 'package:tabibinet_project/Providers/Onboard/onboard_provider.dart';
import 'package:tabibinet_project/Providers/PayWall/paywall_provider.dart';
import 'package:tabibinet_project/Providers/SignUp/sign_up_provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientBottomNavBar/patient_bottom_nav_bar.dart';

import 'Providers/BottomNav/bottom_navbar_provider.dart';
import 'Providers/Language/language_provider.dart';
import 'Providers/PatientHome/patient_home_provider.dart';
import 'Screens/PatientScreens/PatientHomeScreen/patient_home_screen.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => OnboardProvider(),),
            ChangeNotifierProvider(create: (context) => LanguageProvider(),),
            ChangeNotifierProvider(create: (context) => LocationProvider(),),
            ChangeNotifierProvider(create: (context) => SignUpProvider(),),
            ChangeNotifierProvider(create: (context) => PaywallProvider(),),
            ChangeNotifierProvider(create: (context) => BottomNavBarProvider(),),
            ChangeNotifierProvider(create: (context) => PatientHomeProvider(),),
            ChangeNotifierProvider(create: (context) => DateProvider(),),
          ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TabibiNet',
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: themeColor,primary: themeColor),
            useMaterial3: true,
          ),
          home: PatientBottomNavBar(),
        ),
      );
    },);
  }
}


