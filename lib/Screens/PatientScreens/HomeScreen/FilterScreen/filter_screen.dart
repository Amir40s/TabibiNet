import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Providers/PatientHome/patient_home_provider.dart';
import 'package:tabibinet_project/Screens/PatientScreens/HomeScreen/FilterScreen/Components/option_tile.dart';
import 'package:tabibinet_project/Widgets/header.dart';
import 'package:tabibinet_project/Widgets/submit_button.dart';

import '../../../../Constants/app_fonts.dart';
import '../../../../Widgets/dotted_line.dart';
import '../../../../Widgets/text_widget.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final List<String> options = [
    "Popularity",
    "Star Rating (highest first)",
    "Star Rating (highest first)",
    "Best Reviewed First",
    "Mast Reviewed First",
    "Price (lowest first)",
    "Price (highest first)",
  ];

  final List<String> experience = [
    "Any Experience",
    "Less than year",
    "1 - 5",
    "2 - 10",
    "5 - 10",
    "6 - 10",
    "8 - 10",
    "9 - 5",
  ];

  final List<String> rating = [
    "2.4",
    "3.4",
    "4.4",
    "6.8",
    "7.5",
  ];

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
    final provider = Provider.of<PatientHomeProvider>(context,listen: false);
    final DateTime today = DateTime.now();
    final List<DateTime> days = List.generate(
      7,
          (index) => today.add(Duration(days: index)),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Header(text: "Filter"),
           Expanded(
               child: ListView(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             const TextWidget(
                               text: "Available Today", fontSize: 20,
                               fontWeight: FontWeight.w600, isTextCenter: false,
                               textColor: textColor, fontFamily: AppFonts.semiBold,),
                             const Spacer(),
                             Consumer<PatientHomeProvider>(builder: (context, provider, child) {
                               return CupertinoSwitch(
                                 applyTheme: true,
                                 value: provider.isFilter,
                                 onChanged: (value) {
                                   provider.setFilter(value);
                                 },
                               );
                             },),
                           ],
                         ),
                         SizedBox(height: height1,),
                         const DottedLine(
                           height: 2,
                           color: greyColor,
                           dotLength: 4,
                           spacing: 4,
                           direction: Axis.horizontal,
                         ),
                         SizedBox(height: height1,),
                         const TextWidget(
                           text: "Sort Option", fontSize: 20,
                           fontWeight: FontWeight.w600, isTextCenter: false,
                           textColor: textColor, fontFamily: AppFonts.semiBold,),
                         SizedBox(height: height1,),
                         Container(
                           width: 100.w,
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           decoration: BoxDecoration(
                             color: bgColor,
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(
                               color: greyColor
                             )
                           ),
                           child: Consumer<PatientHomeProvider>(
                             builder: (context, value, child) {
                             return ListView.separated(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: options.length,
                               itemBuilder: (context, index) {
                                 final isSelected = value.currentOption == index;
                                 return OptionTile(
                                   title: options[index],
                                   image: isSelected ? IconsPath.radioOnIcon : IconsPath.radioOffIcon,
                                   onTap: () {
                                   value.setOption(index);
                                 },);
                               },
                               separatorBuilder: (context, index) {
                                 return const DottedLine(
                                   height: 2,
                                   color: greyColor,
                                   dotLength: 4,
                                   spacing: 4,
                                   direction: Axis.horizontal,
                                 );
                               },
                             );
                           },
                           ),
                         ),
                         SizedBox(height: height1,),
                         const TextWidget(
                           text: "Gender", fontSize: 20,
                           fontWeight: FontWeight.w600, isTextCenter: false,
                           textColor: textColor, fontFamily: AppFonts.semiBold,),
                         SizedBox(height: height1,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SubmitButton(
                                 bgColor: secondaryGreenColor,
                                 textColor: themeColor,
                                 width: 43.w,
                                 title: "Male",
                                 press: (){}
                             ),
                             SubmitButton(width: 43.w,title: "Female", press: (){}),
                           ],
                         ),
                         SizedBox(height: height1,),
                         const TextWidget(
                           text: "Work Experience ( years )", fontSize: 20,
                           fontWeight: FontWeight.w600, isTextCenter: false,
                           textColor: textColor, fontFamily: AppFonts.semiBold,),
                         SizedBox(height: height1,),
                         SizedBox(
                           width: 100.w,
                           child: Consumer<PatientHomeProvider>(
                             builder: (context, value, child) {
                             return GridView.builder(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: experience.length,
                               itemBuilder: (context, index) {
                                 final isSelected = value.currentExperience == index;
                                 return SubmitButton(
                                   bgColor: bgColor,
                                   iconColor: themeColor,
                                   textColor: isSelected ? themeColor : textColor,
                                   bdColor: isSelected ? themeColor : greyColor,
                                   title: experience[index],
                                   press: () {
                                     value.setExperience(index);
                                 },);
                               },
                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2,
                                   mainAxisExtent: 70,
                                   mainAxisSpacing: 20,
                                   crossAxisSpacing: 10
                               ),
                             );
                           },
                           ),
                         ),
                         SizedBox(height: height1,),
                         Row(
                           children: [
                             const TextWidget(
                               text: "Schedules", fontSize: 20,
                               fontWeight: FontWeight.w600, isTextCenter: false,
                               textColor: textColor, fontFamily: AppFonts.semiBold,),
                             const Spacer(),
                             const TextWidget(
                                 text: "January", fontSize: 12,
                                 fontWeight: FontWeight.w400, isTextCenter: false,
                                 textColor: textColor),
                             const SizedBox(width: 8,),
                             Container(
                               height: 35,
                               width: 35,
                               decoration: const BoxDecoration(
                                 color: bgColor,
                                 shape: BoxShape.circle,
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey,
                                     blurRadius: 1.2
                                   )
                                 ]
                               ),
                               child: const Icon(CupertinoIcons.forward,color: themeColor,size: 20,),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 120,
                     width: 100.w,
                     child: ListView(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: days.map((date) {
                               final isSelected = provider.selectedDate.day == date.day;

                               return GestureDetector(
                                 onTap: () {
                                   provider.selectDate(date);
                                 },
                                 child: Container(
                                   width: 70,
                                   margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                   padding: const EdgeInsets.symmetric(vertical: 10.0),
                                   decoration: BoxDecoration(
                                     color: isSelected ? Colors.blue : Colors.white,
                                     borderRadius: BorderRadius.circular(10),
                                     border: isSelected
                                         ? null
                                         : Border.all(color: themeColor),
                                   ),
                                   child: Column(
                                     children: [
                                       Text(
                                         date.day.toString(),
                                         style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                           color: isSelected ? Colors.white : Colors.black,
                                         ),
                                       ),
                                       const SizedBox(height: 5),
                                       Text(
                                         getWeekday(date.weekday),
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: isSelected ? Colors.white : Colors.black,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               );
                             }).toList(),
                           ),
                         ),
                       ],
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 20.0),
                     child: TextWidget(
                       text: "Rating", fontSize: 20,
                       fontWeight: FontWeight.w600, isTextCenter: false,
                       textColor: textColor, fontFamily: AppFonts.semiBold,),
                   ),
                   SizedBox(height: height1,),
                   SizedBox(
                     height: 40,
                     width: 100.w,
                     child: Consumer<PatientHomeProvider>(
                       builder: (context, value, child) {
                         return ListView.builder(
                           padding: const EdgeInsets.only(left: 20),
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemCount: rating.length,
                           itemBuilder: (context, index) {
                             final isSelected = value.currentRating == index;
                             return Padding(
                               padding: const EdgeInsets.only(right: 10),
                               child: SubmitButton(
                                 width: 20.w,
                                 bgColor: isSelected ? themeColor : bgColor ,
                                 icon: isSelected ? CupertinoIcons.star_fill : CupertinoIcons.star,
                                 iconSize: 15,
                                 iconColor: isSelected ? bgColor : themeColor,
                                 textColor: isSelected ? bgColor : textColor,
                                 bdColor: isSelected ? themeColor : greyColor,
                                 title: rating[index],
                                 press: () {
                                   value.setRating(index);
                                 },),
                             );
                           },
                         );
                       },
                     ),
                   ),
                   SizedBox(height: height1,),

                 ],
               )
           )
          ],
        ),
      ),
    );
  }

  String getWeekday(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

}
