import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_fonts.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/header.dart';
import '../../../model/res/widgets/input_field.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../FilterScreen/filter_screen.dart';
import '../FindDoctorScreen/Components/suggestion_container.dart';
import '../PatientHomeScreen/components/top_doctor_container.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  final List<Map<String, String>> suggestion = [
    {'title': 'General'},
    {'title': 'Login'},
    {'title': 'Account'},
    {'title': 'Doctor'},
    {'title': 'Label'},
  ];
  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 20,),
                    SizedBox(
                        height: 40,
                        width: 100.w,
                        child: Consumer<PatientHomeProvider>(
                          builder: (context, provider, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: suggestion.length,
                              itemBuilder: (context, index) {
                                final isSelected = provider.selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    provider.selectButton(index);
                                  },
                                  child: SuggestionContainer(
                                      text: suggestion[index]["title"]!,
                                      boxColor: isSelected ? themeColor : bgColor,
                                      textColor: isSelected ? bgColor : themeColor),
                                );
                              },);
                          },)
                    ),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          TextWidget(
                            text: "480 Founds", fontSize: 20,
                            fontWeight: FontWeight.w600, isTextCenter: false,
                            textColor: textColor, fontFamily: AppFonts.semiBold,),
                          Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const TopDoctorContainer();
                      },
                    ),

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
