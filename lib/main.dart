import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/Favorite/favorite_doctor_provider.dart';

import 'Providers/BottomNav/bottom_navbar_provider.dart';
import 'Providers/DoctorAppointment/doctor_appointment_provider.dart';
import 'Providers/DoctorHome/doctor_home_provider.dart';
import 'Providers/DoctorProfile/doctor_profile_provider.dart';
import 'Providers/FindDoctor/find_doctor_provider.dart';
import 'Providers/Language/language_provider.dart';
import 'Providers/Location/location_provider.dart';
import 'Providers/Medicine/medicine_provider.dart';
import 'Providers/Onboard/onboard_provider.dart';
import 'Providers/PatientAppointment/patient_appointment_provider.dart';
import 'Providers/PatientHome/patient_home_provider.dart';
import 'Providers/PatientNotification/patient_notification_provider.dart';
import 'Providers/PatientProfile/patient_profile_provider.dart';
import 'Providers/PayWall/paywall_provider.dart';
import 'Providers/SignIn/sign_in_provider.dart';
import 'Providers/SignUp/sign_up_provider.dart';
import 'Screens/StartScreens/SplashScreen/splash_screen.dart';
import 'constant.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'global_provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp
      ]
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            ChangeNotifierProvider(create: (context) => SignInProvider(),),
            ChangeNotifierProvider(create: (context) => PaywallProvider(),),
            ChangeNotifierProvider(create: (context) => BottomNavBarProvider(),),
            ChangeNotifierProvider(create: (context) => PatientHomeProvider(),),
            ChangeNotifierProvider(create: (context) => DateProvider(),),
            ChangeNotifierProvider(create: (context) => PatientNotificationProvider(),),
            ChangeNotifierProvider(create: (context) => PatientProfileProvider(),),
            ChangeNotifierProvider(create: (context) => DoctorHomeProvider(),),
            ChangeNotifierProvider(create: (context) => DoctorAppointmentProvider(),),
            ChangeNotifierProvider(create: (context) => MedicineProvider(),),
            ChangeNotifierProvider(create: (context) => PatientAppointmentProvider(),),
            ChangeNotifierProvider(create: (context) => FindDoctorProvider(),),
            ChangeNotifierProvider(create: (context) => DoctorProfileProvider(),),
            ChangeNotifierProvider(create: (context) => FavoritesProvider(),),
          ],
        child: GetMaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'TabibiNet',
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: themeColor,primary: themeColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          // home: const DoctorBottomNavbar(),
          // home: const PatientBottomNavBar(),
        ),
      );
    },);
  }
}


