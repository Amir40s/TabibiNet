import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.isTextCenter,
        required this.textColor,
        this.maxLines = 1,
        this.fontFamily = "Regular",
        this.valueKey
      });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isTextCenter;
  final int maxLines;
  final String fontFamily;
  final ValueKey<int>? valueKey;
  @override
  Widget build(BuildContext context) {
    return Text(
      key: valueKey,
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: isTextCenter == true ? TextAlign.center: TextAlign.start,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor,fontFamily: fontFamily),
    );
  }
}
