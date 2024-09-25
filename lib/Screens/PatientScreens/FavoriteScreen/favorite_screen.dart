import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/model/data/user_model.dart';

import '../../../../constant.dart';
import '../../../../model/res/widgets/header.dart';
import '../../../../model/res/widgets/input_field.dart';
import '../../../Providers/Favorite/favorite_doctor_provider.dart';
import '../../../Providers/PatientAppointment/patient_appointment_provider.dart';
import '../../../model/res/constant/app_icons.dart';
import '../DoctorDetailScreen/doctor_detail_screen.dart';
import '../PatientHomeScreen/components/top_doctor_container.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    final appointmentScheduleP = Provider.of<PatientAppointmentProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: "My Favourite Doctor"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Row(
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
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SvgPicture.asset(AppIcons.menuIcon),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  StreamBuilder<List<UserModel>>(
                    stream: favoritesProvider.favoriteDoctorDetailsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No favorite doctors yet"));
                      }

                      final favoriteDoctors = snapshot.data!;

                      return Consumer<FavoritesProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: favoriteDoctors.length,
                            itemBuilder: (context, index) {
                              var doctor = favoriteDoctors[index];
                              return TopDoctorContainer(
                                doctorName: doctor.name,
                                specialityName: doctor.speciality,
                                specialityDetail: doctor.specialityDetail,
                                availabilityFrom: doctor.availabilityFrom,
                                availabilityTo: doctor.availabilityTo,
                                appointmentFee: doctor.appointmentFee,
                                rating: doctor.rating,
                                imageUrl: doctor.profileUrl,
                                isFav: provider.isFavorite(doctor.userUid),
                                likeTap: () {
                                  provider.toggleFavorite(doctor.userUid);
                                  },
                                onTap: () {
                                  appointmentScheduleP.setDoctorDetails(
                                      doctor.userUid,
                                      doctor.name,
                                      doctor.location,
                                      doctor.rating
                                  );
                                  appointmentScheduleP.setAvailabilityTime(
                                      doctor.availabilityFrom,
                                      doctor.availabilityTo
                                  );
                                  Get.to(()=> DoctorDetailScreen(
                                    doctorName: doctor.name,
                                    specialityName: doctor.speciality,
                                    doctorDetail: doctor.specialityDetail,
                                    yearsOfExperience: doctor.experience,
                                    patients: doctor.patients,
                                    reviews: doctor.reviews,
                                    image: doctor.profileUrl,
                                  ));
                                  },
                              );
                              },
                          );
                          },);
                      },
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
