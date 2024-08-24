import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/app_fonts.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

class PlanRow extends StatelessWidget {
  const PlanRow({
    super.key,
    required this.tickColor,
    required this.text,
  });

  final Color tickColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: tickColor,
              shape: BoxShape.circle
            ),
            child: Icon(Icons.done_sharp,size: 20,color: bgColor,),
          ),
          SizedBox(width: 15,),
          SizedBox(
            width: 70.w,
            child: TextWidget(
                text: text, fontSize: 16,
                fontWeight: FontWeight.w500, isTextCenter: false,
                textColor: textColor,fontFamily: AppFonts.medium,maxLines: 3,),
          ),
        ],
      ),
    );
  }
}
