import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/PatientHome/patient_home_provider.dart';
import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/widgets/dotted_line.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/submit_button.dart';
import '../../../../model/res/widgets/text_widget.dart';
import 'Components/calender_section.dart';
import 'Components/experience_section.dart';
import 'Components/option_section.dart';
import 'Components/rating_section.dart';
import 'Components/time_section.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height1 = 20;
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
                             Consumer<PatientHomeProvider>(
                               builder: (context, provider, child) {
                               return CupertinoSwitch(
                                 applyTheme: true,
                                 value: provider.isFilter,
                                 onChanged: (value) {
                                   provider.setFilter(value);
                                 },
                               );
                             },
                             ),
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
                         OptionSection(),
                         SizedBox(height: height1,),
                         const TextWidget(
                           text: "Gender", fontSize: 20,
                           fontWeight: FontWeight.w600, isTextCenter: false,
                           textColor: textColor, fontFamily: AppFonts.semiBold,),
                         SizedBox(height: height1,),
                         Consumer<PatientHomeProvider>(
                           builder: (context, value, child) {
                           return Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               SubmitButton(
                                   bgColor: value.selectedGender == "Male" ? themeColor
                                       : secondaryGreenColor,
                                   textColor: value.selectedGender == "Male" ? bgColor
                                       : themeColor,
                                   width: 43.w,
                                   title: "Male",
                                   press: (){
                                     value.selectGender("Male");
                                   }
                               ),
                               SubmitButton(
                                   width: 43.w,
                                   title: "Female",
                                   bgColor: value.selectedGender == "Female"? themeColor
                                       : secondaryGreenColor,
                                   textColor: value.selectedGender == "Female"? bgColor
                                       : themeColor,
                                   press: (){
                                     value.selectGender("Female");
                                   }
                               ),
                             ],
                           );
                         },),
                         SizedBox(height: height1,),
                         const TextWidget(
                           text: "Work Experience ( years )", fontSize: 20,
                           fontWeight: FontWeight.w600, isTextCenter: false,
                           textColor: textColor, fontFamily: AppFonts.semiBold,),
                         SizedBox(height: height1,),
                         ExperienceSection(),
                         SizedBox(height: height1,),
                         Consumer<DateProvider>(
                           builder: (context, dateProvider, child) {
                             DateTime currentMonth = dateProvider.selectedDate;
                             return Row(
                               children: [
                                 const TextWidget(
                                   text: "Schedules", fontSize: 20,
                                   fontWeight: FontWeight.w600, isTextCenter: false,
                                   textColor: textColor, fontFamily: AppFonts.semiBold,),
                                 const Spacer(),
                                 InkWell(
                                   onTap:  () async {
                                     DateTime? selectedDate = await showDatePicker(
                                       context: context,
                                       initialDate: currentMonth,
                                       firstDate: DateTime(2000),
                                       lastDate: DateTime(2100),
                                     );
                                     if (selectedDate != null) {
                                       dateProvider.updateSelectedDate(selectedDate);
                                     }
                                   },
                                   child: Row(
                                     children: [
                                       TextWidget(
                                           text: DateFormat('MMMM-yyyy').format(currentMonth), fontSize: 12,
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
                                 )
                               ],
                             );
                           },),
                       ],
                     ),
                   ),
                   SizedBox(height: height1,),
                   Consumer<DateProvider>(
                     builder: (context, dateProvider, child) {
                       return CalendarSection(month: dateProvider.selectedDate);
                     },),
                   SizedBox(height: height1,),
                   TimeSection(),
                   SizedBox(height: height1,),
                   const Padding(
                     padding: EdgeInsets.only(left: 20.0),
                     child: TextWidget(
                       text: "Rating", fontSize: 20,
                       fontWeight: FontWeight.w600, isTextCenter: false,
                       textColor: textColor, fontFamily: AppFonts.semiBold,),
                   ),
                   SizedBox(height: height1,),
                   RatingSection(),
                   SizedBox(height: height1,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: SubmitButton(
                       title: "Apply Filters",
                       press: () {

                     },),
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

}
