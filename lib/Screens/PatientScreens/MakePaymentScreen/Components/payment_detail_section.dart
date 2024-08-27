import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../model/res/widgets/dotted_line.dart';
import '../../../../../model/res/widgets/text_widget.dart';

class PaymentDetailSection extends StatelessWidget {
  const PaymentDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: secondaryGreenColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: greenColor)
      ),
      child: const Column(
        children: [
          ListTile(
            title: TextWidget(
                text: "Consulting", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: false,
                textColor: textColor
            ),
            trailing: TextWidget(
                text: "\$30.00", fontSize: 16,
                fontWeight: FontWeight.w400, isTextCenter: false,
                textColor: textColor
            ),
          ),
          ListTile(
            title: TextWidget(
                text: "Other Manipulation", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: false,
                textColor: textColor
            ),
            trailing: TextWidget(
                text: "\$35.00", fontSize: 16,
                fontWeight: FontWeight.w400, isTextCenter: false,
                textColor: textColor
            ),
          ),
          ListTile(
            title: TextWidget(text: "Other Service", fontSize: 14, fontWeight: FontWeight.w400, isTextCenter: false, textColor: textColor),
            trailing: TextWidget(text: "\$20.00", fontSize: 16, fontWeight: FontWeight.w400, isTextCenter: false, textColor: textColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: DottedLine(color: greyColor,),
          ),
          ListTile(
            title: TextWidget(
              text: "Total", fontSize: 14,
              fontWeight: FontWeight.w600, isTextCenter: false,
              textColor: textColor, fontFamily: AppFonts.semiBold,
            ),
            trailing: TextWidget(
              text: "\$85.00", fontSize: 16,
              fontWeight: FontWeight.w400, isTextCenter: false,
              textColor: themeColor, fontFamily: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
