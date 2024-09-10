import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/FindDoctor/find_doctor_provider.dart';
import 'package:tabibinet_project/model/res/constant/app_fonts.dart';
import 'package:tabibinet_project/Providers/PatientHome/patient_home_provider.dart';

import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/input_field.dart';
import '../../../../model/res/widgets/text_widget.dart';
import '../../../Providers/PatientAppointment/patient_appointment_provider.dart';
import '../../../model/data/user_model.dart';
import '../../../model/res/constant/app_icons.dart';
import '../DoctorDetailScreen/doctor_detail_screen.dart';
import '../FilterScreen/filter_screen.dart';
import '../PatientHomeScreen/components/top_doctor_container.dart';
import 'Components/suggestion_container.dart';

class FindDoctorScreen extends StatelessWidget {
  FindDoctorScreen({super.key});

  final List<Map<String, String>> suggestion = [
    {'title': 'All'},
    {'title': 'General'},
    {'title': 'Cardiologist'},
    {'title': 'Dentist'},
    {'title': 'Nutritionist'},
    {'title': 'Label'},
  ];
  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<PatientHomeProvider>(context,listen: false);
    final appointmentScheduleP = Provider.of<PatientAppointmentProvider>(context, listen: false);
    final findDoctorP = Provider.of<FindDoctorProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "Top Doctor"),
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
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.all(14),
                                    padding: const EdgeInsets.all(3),
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: greenColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(AppIcons.crossIcon),
                                  ),
                              )),
                          InkWell(
                            onTap: () {
                              Get.to(()=>FilterScreen());
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
                      child: Consumer<FindDoctorProvider>(
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
                                provider.setDoctorCategory(index,suggestion[index]["title"]!);
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
                    Consumer<FindDoctorProvider>(
                      builder: (context, provider, child) {
                        return StreamBuilder<List<UserModel>>(
                          stream: provider.selectDoctorCategory != null && provider.selectDoctorCategory != "All" ?
                          userViewModel.fetchFilterDoctors(provider.selectDoctorCategory!)
                              : userViewModel.fetchDoctors(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            }
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(child: Text('No Doctors found'));
                            }

                            // List of users
                            final users = snapshot.data!;
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                final doctorId = user.userUid;
                                return TopDoctorContainer(
                                  doctorName: user.name,
                                  specialityName: user.speciality,
                                  specialityDetail: user.specialityDetail,
                                  availabilityFrom: user.availabilityFrom,
                                  availabilityTo: user.availabilityTo,
                                  appointmentFee: user.appointmentFee,
                                  imageUrl: user.profileUrl,
                                  rating: user.rating,
                                  isFav: true,
                                  onTap: () {
                                    appointmentScheduleP.setAvailabilityTime(
                                        user.availabilityFrom,
                                        user.availabilityTo
                                    );
                                    Get.to(()=> DoctorDetailScreen(
                                      doctorName: user.name,
                                      specialityName: user.speciality,
                                      doctorDetail: user.specialityDetail,
                                      yearsOfExperience: user.experience,
                                      patients: user.patients,
                                      reviews: user.reviews,
                                      image: user.profileUrl,
                                    ));
                                  },
                                );
                              },
                            );
                          },
                        );
                    },)
                    
                  ],
            ))
          ],
        ),
      ),
    );
  }
}
