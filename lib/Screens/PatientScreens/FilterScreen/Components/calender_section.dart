import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constant.dart';
import '../../../../../model/res/constant/app_fonts.dart';
import '../../../../../Providers/PatientHome/patient_home_provider.dart';

class CalendarSection extends StatelessWidget {
  final DateTime month;

  const CalendarSection({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
            child: Consumer<DateProvider>(
              builder: (context, dateProvider, child) {
                DateTime selectedDate = dateProvider.selectedDate;
                DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
                int daysInMonth = DateTime(month.year, month.month + 1, 0).day;

                return GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      dateProvider.updateSelectedDate(pickedDate);
                    }
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daysInMonth,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      DateTime date = firstDayOfMonth.add(Duration(days: index));
                      bool isSelected = selectedDate.day == date.day &&
                          selectedDate.month == date.month &&
                          selectedDate.year == date.year;

                      return Container(
                        width: 60,
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: isSelected ? themeColor : Colors.transparent,
                          border: Border.all(color: themeColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.semiBold,
                                color: isSelected ? bgColor : textColor,
                              ),
                            ),
                            Text(
                              DateFormat('E').format(date),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected ? bgColor : textColor,
                                  fontFamily: AppFonts.regular
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
