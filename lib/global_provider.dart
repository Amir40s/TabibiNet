import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';
import 'package:tabibinet_project/Providers/chatProvider/chatProvider.dart';
import 'Providers/BottomNav/bottom_navbar_provider.dart';
import 'Providers/FindDoctor/find_doctor_provider.dart';
import 'Providers/Medicine/medicine_provider.dart';
import 'Providers/PatientNotification/patient_notification_provider.dart';
import 'Providers/Profile/profile_provider.dart';
import 'Providers/SignIn/sign_in_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class GlobalProviderAccess {

  static SignInProvider? get signPro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<SignInProvider>(context, listen: false);
    }
    return null;
  }

  static LanguageProvider? get languagePro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<LanguageProvider>(context, listen: false);
    }
    return null;
  }

  static ProfileProvider? get profilePro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<ProfileProvider>(context, listen: false);
    }
    return null;
  }

  static FindDoctorProvider? get findDoctorPro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<FindDoctorProvider>(context, listen: false);
    }
    return null;
  }


  static PatientNotificationProvider? get patientNotificationPro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<PatientNotificationProvider>(context, listen: false);
    }
    return null;
  }

  static BottomNavBarProvider? get bottomNavProvider {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<BottomNavBarProvider>(context, listen: false);
    }
    return null;
  }

  static MedicineProvider? get medicineProvider {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<MedicineProvider>(context, listen: false);
    }
    return null;
  }

  static ChatProvider? get chatProvider {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<ChatProvider>(context, listen: false);
    }
    return null;
  }

}