import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Providers/Location/location_provider.dart';
import 'package:tabibinet_project/Providers/Onboard/onboard_provider.dart';
import 'package:tabibinet_project/Providers/PayWall/paywall_provider.dart';
import 'package:tabibinet_project/Providers/SignUp/sign_up_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/SplashScreen/splash_screen.dart';

import 'Providers/Language/language_provider.dart';

void main() {
  runApp(const MyApp());
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
          ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TabibiNet',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: themeColor,primary: themeColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      );
    },);
  }
}


