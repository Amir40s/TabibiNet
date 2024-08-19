import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/LanguageScreen/Components/language_container.dart';
import 'package:tabibinet_project/Screens/StartScreens/location_screen.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final List<Map<String, String>> options = [
    {'title': 'French', 'subtitle': '', 'icon': IconsPath.flag_1},
    {'title': 'Arabic', 'subtitle': '', 'icon': IconsPath.flag_2},
    {'title': 'English', 'subtitle': '', 'icon': IconsPath.flag_3},
    {'title': 'Spanish', 'subtitle': '', 'icon': IconsPath.flag_4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            TextWidget1(
                text: "Choose Language", fontSize: 24,
                fontWeight: FontWeight.w600, isTextCenter: false,
                textColor: textColor),
            SizedBox(height: 10,),
            TextWidget1(
                text: "Choose language for app to show", fontSize: 14,
                fontWeight: FontWeight.w400, isTextCenter: false,
                textColor: textColor),
            SizedBox(height: 20,),
            Consumer<LanguageProvider>(builder: (context, provider, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final isSelected = provider.selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      provider.selectButton(index);
                    },
                    child: LanguageContainer(
                      title: options[index]['title']!,
                      subTitle: isSelected ? "Primary Language" : "",
                      image: options[index]['icon']!,
                      boxColor: isSelected? themeColor : bgColor,
                      textColor: isSelected? bgColor: textColor,
                      boundaryColor: isSelected? themeColor :greyColor,
                      borderColor: isSelected ? themeColor : lightGreenColor,
                    ),
                  );
                },
              );
            },),
            SizedBox(height: 20,),
            SubmitButton(
              title: "Next",
              press: () {
                Get.to(()=>LocationScreen());
            },)

          ],
        ),
      ),
    );
  }
}

//GoalContainer(
//                           title: options[index]['title']!, titleColor: isSelected ? bgColor : textColor,
//                           subTitle: options[index]['subtitle']!, subTitleColor: isSelected ? bgColor : textColor,
//                           image: options[index]['icon']!, containerColor: isSelected ? themeColor : lightGreyColor,
//                           borderColor: isSelected ? Color(0xffFDDCC5): Colors.transparent,
//                           imageColor: isSelected ? bgColor : greyColor),