import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../../../model/res/widgets/text_widget.dart';

class AgeSection extends StatelessWidget {
  AgeSection({super.key});

  final List<String> age = [
    "20+",
    "30+",
    "40+",
    "50+",
    "60+",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Consumer<PatientHomeProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: age.length,
            itemBuilder: (context, index) {
              final isSelected = value.selectPatientAge == index;
              return GestureDetector(
                onTap: () {
                  value.setPatientAge(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                  decoration: BoxDecoration(
                      color: isSelected ? themeColor : bgColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: themeColor)
                  ),
                  child: Center(
                    child: TextWidget(
                      text: age[index], fontSize: 16,
                      fontWeight: FontWeight.w500, isTextCenter: false,
                      textColor: isSelected ? bgColor : themeColor, fontFamily: AppFonts.medium,),
                  ),
                ),
              );
            },);
        },),
    );
  }
}