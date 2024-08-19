import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../../../../Constants/colors.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.boxColor,
    required this.textColor,
    required this.boundaryColor,
    required this.borderColor,
  });

  final Color boxColor;
  final Color textColor;
  final Color borderColor;
  final Color boundaryColor;
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: boundaryColor
        ),
        color: boxColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(14),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgColor,
              border: Border.all(
                color: borderColor
              )
            ),
            child: Center(child: Image.asset(image)),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget1(
                  text: title, fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
              TextWidget1(
                  text: subTitle, fontSize: 12,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor),
            ],
          )
        ],
      ),
    );
  }
}
