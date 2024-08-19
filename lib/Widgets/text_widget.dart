import 'package:flutter/material.dart';

class TextWidget1 extends StatelessWidget {
  const TextWidget1(
      {super.key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.isTextCenter,
        required this.textColor,
        this.maxLines,
        this.valueKey
      });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isTextCenter;
  final int? maxLines;
  final ValueKey<int>? valueKey;
  @override
  Widget build(BuildContext context) {
    return Text(
      key: valueKey,
      text,
      maxLines: maxLines,
      textAlign: isTextCenter == true ? TextAlign.center: TextAlign.justify,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor,fontFamily: "Regular"),
    );
  }
}

class TextWidget2 extends StatelessWidget {
  const TextWidget2(
      {super.key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.isTextCenter,
        required this.textColor,
        this.maxLines,
        this.valueKey,
      });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isTextCenter;
  final int? maxLines;
  final ValueKey<int>? valueKey;
  @override
  Widget build(BuildContext context) {
    return Text(
      key: valueKey,
      text,
      maxLines: maxLines,
      textAlign: isTextCenter == true ? TextAlign.center: TextAlign.justify,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor,fontFamily: "Medium"),
    );
  }
}

class TextWidget3 extends StatelessWidget {
  const TextWidget3(
      {super.key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.isTextCenter,
        required this.textColor,
        this.maxLines,
        this.valueKey,
      });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isTextCenter;
  final int? maxLines;
  final ValueKey<int>? valueKey;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isTextCenter == true ? TextAlign.center: TextAlign.justify,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor,fontFamily: "Bold"),
    );
  }
}
