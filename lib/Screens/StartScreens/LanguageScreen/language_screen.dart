import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/PatientBottomNavBar/patient_bottom_nav_bar.dart';
import 'package:tabibinet_project/Screens/StartScreens/LanguageScreen/Components/language_container.dart';
import 'package:tabibinet_project/Screens/StartScreens/LocationScreen/location_screen.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key,required this.isNextButton});

  final bool isNextButton;

  final List<Map<String, String>> options = [
    {'title': 'French', 'subtitle': '', 'icon': AppIcons.flag_1},
    {'title': 'Arabic', 'subtitle': '', 'icon': AppIcons.flag_2},
    {'title': 'English', 'subtitle': '', 'icon': AppIcons.flag_3},
    {'title': 'Spanish', 'subtitle': '', 'icon': AppIcons.flag_4},
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
                        borderColor: isSelected ? themeColor : greenColor,
                      ),
                    );
                  },
                );
              },),
              const SizedBox(height: 20,),
              SubmitButton(
                title: isNextButton? "Next" : "Select",
                press: () {
                  if(isNextButton){
                  Get.to(()=>const LocationScreen());
                  }else{
                    Get.back();
                  }
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