import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../../Screens/StartScreens/OtpScreen/otp_screen.dart';

class AppUtils{

  int generateUniqueNumber() {
    // Generate a random 4-digit number
    int min = 1000,max  = 9999;

    Random random = Random();
    int randomNumber = random.nextInt(max - min + 1) + min;

    // Ensure uniqueness by checking against a list of used numbers
    List<int> usedNumbers = [];
    while (usedNumbers.contains(randomNumber)) {
      randomNumber = random.nextInt(max - min + 1) + min;
    }

    // Add the generated number to the used list
    usedNumbers.add(randomNumber);

    return randomNumber;
  }

  void sendMail({
    required String recipientEmail,
    required String otpCode,
    required BuildContext context,
    String request = "",
  }) async {
    // change your email here
    String username = 'tabibinet82@gmail.com';
    // change your password here
    String password = 'wham ksgn qufv upla';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'TabibiNet')
      ..recipients.add(recipientEmail)
      ..subject = 'One-Time OTP Verification '
      ..text = "Your TabibiNet Verification Code is: $otpCode";

    try {
      await send(message, smtpServer);
      Get.snackbar("OTP SEND", "Email sent successfully");
      Get.to(()=>OtpScreen(otp: otpCode.toString(),));
      if(!context.mounted) return;
      // Provider.of<ValueProvider>(context,listen: false).setLoading(false);
      // if(request == "resend"){
      // }else{
      //   Get.offAll(OtpScreen(otpCode: otpCode,email: recipientEmail));
      // }

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

}