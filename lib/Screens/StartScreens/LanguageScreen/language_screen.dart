import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/LanguageScreen/Components/language_container.dart';
import 'package:tabibinet_project/Screens/StartScreens/LocationScreen/location_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              const TextWidget(
                  text: "Choose Language", fontSize: 24,
                  fontWeight: FontWeight.w600, isTextCenter: false,
                  textColor: textColor),
              const SizedBox(height: 10,),
              const TextWidget(
                  text: "Choose language for app to show", fontSize: 14,
                  fontWeight: FontWeight.w400, isTextCenter: false,
                  textColor: textColor),
              const SizedBox(height: 20,),
              Consumer<LanguageProvider>(builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(height: 20,),
              SubmitButton(
                title: "Next",
                press: () {
                  Get.to(()=>const LocationScreen());
              },)
            ],
          ),
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