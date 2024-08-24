import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Providers/PatientHome/patient_home_provider.dart';

class CalenderSection extends StatelessWidget {
  const CalenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PatientHomeProvider>(context,listen: false);
    final DateTime today = DateTime.now();
    final List<DateTime> days = List.generate(
      7,
          (index) => today.add(Duration(days: index)),
    );
    return SizedBox(
      height: 130,
      width: 100.w,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: greyColor
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0,top: 16.0,bottom: 16.0,left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: days.map((date) {
                  final isSelected = provider.selectedDate.day == date.day;

                  return GestureDetector(
                    onTap: () {
                      provider.selectDate(date);
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
          ),
        ],
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
