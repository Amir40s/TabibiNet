import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/services/NotificationServices/flutter_local_notification.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/widgets/text_widget.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class PatientDetailChart extends StatelessWidget {
  const PatientDetailChart({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 20;
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 100.w,
        decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: "Patient Details", fontSize: 18.sp,
                fontWeight: FontWeight.w600, isTextCenter: false,
                textColor: bgColor),
            SizedBox(height: height,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pie Chart
                SizedBox(
                  height: 100,
                  width: 30.w,
                  child: PieChart(
                    PieChartData(
                      sections: showingSections(),
                      centerSpaceRadius: 40,
                      sectionsSpace: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailItem(Colors.lightBlueAccent, "Total Patient", "00"),
                    buildDetailItem(Colors.red, "Prescription sent", "00"),
                    buildDetailItem(Colors.yellow, "Documents shared", "00"),
                  ],
                ),
              ],
            ),
            SizedBox(height: height,),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.yellow,
        value: 25,
        radius: 13,
        showTitle: false,
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 25,
        radius: 13,
        showTitle: false,
      ),
      PieChartSectionData(
        color: Colors.lightBlueAccent,
        value: 25,
        radius: 13,
        showTitle: false,
      ),
    ];
  }

  Widget buildDetailItem(Color color, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: 40.w,
        child: Row(
          children: [
            CircleAvatar(
              radius: 4,
              backgroundColor: color,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                fontFamily: AppFonts.medium
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                fontFamily: AppFonts.medium
              ),
            ),
          ],
        ),
      ),
    );
  }

}
