import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';
import 'Providers/DoctorProfile/doctor_profile_provider.dart';
import 'Providers/FindDoctor/find_doctor_provider.dart';
import 'Providers/PatientNotification/patient_notification_provider.dart';
import 'Providers/PatientProfile/patient_profile_provider.dart';
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

  static PatientProfileProvider? get patientProfilePro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<PatientProfileProvider>(context, listen: false);
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

  static DoctorProfileProvider? get doctorProfilePro {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Provider.of<DoctorProfileProvider>(context, listen: false);
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

}