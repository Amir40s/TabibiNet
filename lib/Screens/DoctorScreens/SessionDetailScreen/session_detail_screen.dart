import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';
import 'package:tabibinet_project/model/res/widgets/info_tile.dart';
import 'package:tabibinet_project/model/res/widgets/input_field.dart';
import 'package:tabibinet_project/model/res/widgets/submit_button.dart';
import 'package:tabibinet_project/model/res/widgets/text_widget.dart';

class SessionDetailScreen extends StatelessWidget {
  SessionDetailScreen({
    super.key,
    required this.status,
    required this.statusTextColor,
    required this.boxColor,
  });

  final String status;
  final Color statusTextColor;
  final Color boxColor;
  final nameC = TextEditingController();
  final ageC = TextEditingController();
  final genderC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
    double height2 = 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Session Details"),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: height1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Patient Details", fontSize: 18.sp,
                          fontWeight: FontWeight.w600, isTextCenter: false,
                          textColor: textColor, fontFamily: AppFonts.semiBold,),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: TextWidget(
                            text: status, fontSize: 16,
                            fontWeight: FontWeight.w500, isTextCenter: false,
                            textColor: statusTextColor, fontFamily: AppFonts.medium,),
                        ),
                      ],
                    ),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Full Name", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "Micheal Rickliff"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Age", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "22"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Gender", fontSize: 14.sp,
                      fontWeight: FontWeight.w600, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.semiBold,),
                    SizedBox(height: height2,),
                    const InfoTile(title: "Male"),
                    SizedBox(height: height1,),
                    TextWidget(
                      text: "Present Complaint ", fontSize: 16.sp,
                      fontWeight: FontWeight.w500, isTextCenter: false,
                      textColor: textColor, fontFamily: AppFonts.medium,),
                    SizedBox(height: height2,),
                    TextWidget(
                      text: "I’m having very bad heart burn"
                          " after meal from past few days."
                          " It’s now killing. I’m willing to "
                          "get some dietary recommendation along"
                          " with medicines for my stomach issues",
                      fontSize: 12.sp, fontWeight: FontWeight.w400,
                      isTextCenter: false, textColor: textColor,
                      fontFamily: AppFonts.regular, maxLines: 10,
                    ),
                    SizedBox(height: height1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubmitButton(
                          width: 40.w,
                          title: "Decline",
                          textColor: redColor,
                          bgColor: redColor.withOpacity(0.1),
                          bdColor: redColor,
                          press: () {

                        },),
                        SubmitButton(
                          width: 40.w,
                          title: "Remind",
                          textColor: const Color(0xff04AD01),
                          bgColor: const Color(0xff04AD01).withOpacity(0.1),
                          bdColor: const Color(0xff04AD01),
                          press: () {

                        },),
                      ],
                    ),
                    SizedBox(height: height1,),
                    SubmitButton(
                      title: "View E-prescriptions",
                      press: () {

                    },)

                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
