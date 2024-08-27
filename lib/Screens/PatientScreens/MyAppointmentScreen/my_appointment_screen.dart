import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/input_field.dart';
import 'Components/my_appointment_container.dart';

class MyAppointmentScreen extends StatelessWidget {
  MyAppointmentScreen({super.key});

  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar Example'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'Car'),
                Tab(icon: Icon(Icons.directions_transit), text: 'Transit'),
                Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              UpComingAppointment(),
              Center(child: Text('Transit Tab')),
              Center(child: Text('Bike Tab')),
            ],
          ),
        ),
      ),
    );
  }
}


class UpComingAppointment extends StatelessWidget {
  UpComingAppointment({super.key});

  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const Header(text: "My Appointment"),
          Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 72.w,
                          height: 50,
                          child: InputField(
                            inputController: searchC,
                            hintText: "Find here!",
                            prefixIcon: Icons.search,
                          )),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(AppIcons.menuIcon),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MyAppointmentContainer();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ))
        ],
      ),
    );
  }
}

