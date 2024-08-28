import 'package:flutter/material.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';

import '../../../constant.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  final TextInputType? type;
  final TextInputAction? textInputAction;
  final String? hintText;
  final int? maxLines, maxLength;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const InputField({
    super.key,
    required this.inputController,
    this.type,
    this.maxLines = 1,
    this.textInputAction,
    this.hintText,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: type,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.medium
      ),
      cursorColor: themeColor,
      controller: inputController,
      maxLength: maxLength,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
            color: greyColor,
            fontFamily: AppFonts.medium
        ),
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: greyColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class InputField2 extends StatelessWidget {
  final TextEditingController inputController;
  final TextInputType? type;
  final TextInputAction? textInputAction;
  final String? hintText;
  final int? maxLines, maxLength;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const InputField2({
    super.key,
    required this.inputController,
    this.type,
    this.maxLines = 1,
    this.textInputAction,
    this.hintText,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: type,
      style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.medium
      ),
      cursorColor: themeColor,
      controller: inputController,
      maxLength: maxLength,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon,color: greyColor,),
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: greyColor,
            fontFamily: AppFonts.medium
        ),
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: greyColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
