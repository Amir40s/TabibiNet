import 'package:flutter/cupertino.dart';

import '../../../../../Constants/app_fonts.dart';
import '../../../../../Constants/colors.dart';
import '../../../../../Widgets/text_widget.dart';

class SuggestionContainer extends StatelessWidget {
  const SuggestionContainer({
    super.key,
    required this.text,
    required this.boxColor,
    required this.textColor,
  });

  final String text;
  final Color boxColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: themeColor
          )
      ),
      child: Center(
        child: TextWidget(
          text: text, fontSize: 16,
          fontWeight: FontWeight.w500, isTextCenter: false,
          textColor: textColor,
          fontFamily: AppFonts.medium,),
      ),
    );
  }
}
