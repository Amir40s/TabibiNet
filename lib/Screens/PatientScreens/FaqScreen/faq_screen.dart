import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/input_field.dart';
import 'Components/faq_cat_section.dart';
import 'Components/faq_section.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height1 = 20;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Faq"),
            Expanded(
                child: ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 72.w,
                              height: 50,
                              child: InputField2(
                                inputController: searchC,
                                hintText: "Find here!",
                                prefixIcon: Icons.search,
                              )),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: themeColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SvgPicture.asset(AppIcons.menuIcon),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height1,),
                    FaqCatSection(),
                    SizedBox(height: height1,),
                    FaqSection()

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
