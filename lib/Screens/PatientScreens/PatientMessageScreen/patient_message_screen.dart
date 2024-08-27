import 'package:flutter/material.dart';
import 'package:tabibinet_project/model/res/widgets/header.dart';

class PatientMessageScreen extends StatelessWidget {
  const PatientMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(text: "Message Screen")
          ],
        ),
      ),
    );
  }
}
