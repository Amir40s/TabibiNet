import 'package:flutter/material.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/MakePaymentScreen/Components/payment_detail_section.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/MakePaymentScreen/Components/payment_method_section.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../../../Widgets/submit_button.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height1 = 20.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Make Payment"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const PaymentDetailSection(),
                    SizedBox(height: height1),
                    const TextWidget(
                  text: "Payment Methods", fontSize: 20,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor, fontFamily: AppFonts.semiBold,
                ),
                    SizedBox(height: height1),
                    const PaymentMethodSection(),
                    SizedBox(height: height1),
                    SubmitButton(
                      title: "Confirm Appointment",
                      press: () {

                      },),
                    SizedBox(height: height1),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
