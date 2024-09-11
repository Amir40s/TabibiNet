import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/Favorite/favorite_doctor_provider.dart';
import '../../../../Providers/PatientAppointment/patient_appointment_provider.dart';
import '../../../../Providers/PatientHome/patient_home_provider.dart';
import '../../../../model/data/user_model.dart';
import '../../DoctorDetailScreen/doctor_detail_screen.dart';
import 'top_doctor_container.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<PatientHomeProvider>(context, listen: false);
    final appointmentScheduleP = Provider.of<PatientAppointmentProvider>(context, listen: false);
    return Consumer(
      builder: (context, value, child) {
        return StreamBuilder<List<UserModel>>(
          stream: userViewModel.fetchDoctors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found'));
            }

            // List of users
            final users = snapshot.data!;

            return Consumer<FavoritesProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return TopDoctorContainer(
                      doctorName: user.name,
                      specialityName: user.speciality,
                      specialityDetail: user.specialityDetail,
                      availabilityFrom: user.availabilityFrom,
                      availabilityTo: user.availabilityTo,
                      appointmentFee: user.appointmentFee,
                      imageUrl: user.profileUrl,
                      rating: user.rating,
                      isFav: provider.isFavorite(user.userUid),
                      likeTap: () {
                        provider.toggleFavorite(user.userUid);
                      },
                      onTap: () {
                        appointmentScheduleP.setDoctorId(user.userUid);
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
            },);
          },
        );
    },);
  }
}
