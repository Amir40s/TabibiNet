import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../../../model/res/widgets/text_widget.dart';

class TimeSection extends StatelessWidget {
  TimeSection({super.key});

  final List<String> time = [
    "10.00 AM",
    "11.00 AM",
    "12.00 AM",
    "01.00 PM",
    "02.00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: greyColor
            )
        ),
        child: SizedBox(
          height: 50,
          child: Consumer<PatientHomeProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: time.length,
                itemBuilder: (context, index) {
                  final isSelected = value.currentTime == index;
                  return GestureDetector(
                    onTap: () {
                      value.selectTime(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(
                          color: isSelected ? themeColor : bgColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: themeColor)
                      ),
                      child: Center(
                        child: TextWidget(
                          text: time[index], fontSize: 16,
                          fontWeight: FontWeight.w500, isTextCenter: false,
                          textColor: isSelected ? bgColor : themeColor, fontFamily: AppFonts.medium,),
                      ),
                    ),
                  );
                },);
            },),
        ),
      ),
    );
  }
}
