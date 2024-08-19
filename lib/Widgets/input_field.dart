import 'package:flutter/material.dart';
import 'package:tabibinet_project/Constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  final TextInputType? type;
  final TextInputAction? textInputAction;
  final String? hintText;
  final int? maxLines, maxLength;
  EdgeInsets contentPadding;
  InputField({
    super.key,
    required this.inputController,
    this.type,
    this.maxLines = 1,
    this.textInputAction,
    this.hintText,
    this.maxLength,
    required this.contentPadding
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
        fontFamily: "Medium"
      ),
      cursorColor: themeColor,
      controller: inputController,
      maxLength: maxLength,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
            fontFamily: "Medium"
        ),
        fillColor: Colors.white,
        contentPadding:  contentPadding,
        filled: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: themeColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}