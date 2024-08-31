import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/EmrScreen/emr_screen.dart';
import 'package:tabibinet_project/Screens/DoctorScreens/PatientManagementData/patient_management_data_screen.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/header.dart';
import '../CheckInteractionScreen/check_interaction_screen.dart';
import '../DosageCalculatorScreen/dosage_calculator_screen.dart';
import '../EPrescriptionScreen/Components/prescription_container.dart';
import '../MedicationLookupScreen/medication_lookup_screen.dart';
import '../PrescribeMedicineScreen/prescribe_medicine_screen.dart';

class PatientManagementScreen extends StatelessWidget {
  const PatientManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const Header(text: "Patient Management"),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 20.h,
                    crossAxisSpacing: 10,
                ),
                children: [
                  PrescriptionContainer(
                    text: "Manage Patients",
                    icon: AppIcons.managePatientIcon,
                    boxColor: const Color(0xff45D0EE),
                    onTap: () {
                      Get.to(()=>PatientManagementDataScreen());
                    },
                  ),
                  PrescriptionContainer(
                    text: "EMR",
                    icon: AppIcons.emrIcon,
                    boxColor: const Color(0xffF24C0F),
                    onTap: () {
                      Get.to(()=>EmrScreen());
                    },
                  ),
                  PrescriptionContainer(
                    text: "Results",
                    icon: AppIcons.resultIcon,
                    boxColor: const Color(0xffDEBA05),
                    onTap: () {
                      Get.to(()=>PrescribeMedicineScreen());
                    },
                  ),
                  PrescriptionContainer(
                    text: "E-prescription",
                    icon: AppIcons.prescriptionIcon,
                    boxColor: const Color(0xff0596DE),
                    onTap: () {
                      Get.to(()=>MedicationLookupScreen());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
