import 'package:get/get.dart';
import 'package:tabibinet_project/Providers/translation/translation_provider.dart';
import 'package:tabibinet_project/model/data/specialize_model.dart';
import 'package:tabibinet_project/Providers/FindDoctor/find_doctor_provider.dart';

import '../Providers/Language/language_provider.dart';
import '../model/data/user_model.dart';

class FindDoctorController extends GetxController {
  final FindDoctorProvider findDoctorProvider;
  RxList<SpecializeModel> specialties = <SpecializeModel>[].obs;
  RxBool isLoading = true.obs;

  RxList<UserModel> doctorsList = <UserModel>[].obs;
  RxBool isDoctor = true.obs;

  FindDoctorController(this.findDoctorProvider);

  @override
  void onInit() {
    fetchSpecialties();
    fetchDoctors();
    super.onInit();
  }


  void fetchAll() {
    fetchSpecialties();
    fetchDoctors();
  }

  void fetchSpecialties() async {
    isDoctor(true);
    try {
      final data = await findDoctorProvider.fetchSpeciality().first;
      specialties.value = data;
      final languageProvider = Get.find<TranslationProvider>();
      languageProvider.setSpecialties(data.map((e) => e.specialty).toList());
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch specialties");
    } finally {
      isLoading(false);
    }
  }

  void fetchDoctors() async {
    isDoctor(true);
    try {
      final data = await findDoctorProvider.fetchDoctors().first;
      doctorsList.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch specialties");
    } finally {
      isDoctor(false);
    }
  }

  void setDoctorCategory(int index, String id, String specialty) {
    findDoctorProvider.setDoctorCategory(index, id, specialty);
  }

}
