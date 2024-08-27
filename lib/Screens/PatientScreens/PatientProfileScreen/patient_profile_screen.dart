import 'package:flutter/material.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(text: "Profile Screen"),
          ],
        ),
      ),
    );
  }
}