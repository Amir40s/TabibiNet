import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/Language/language_provider.dart';

import '../../../Providers/Location/location_provider.dart';
import '../../../constant.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';
import '../AccountTypeScreen/account_type_screen.dart';
import 'Components/google_map_section.dart';
import 'Components/search_location_field.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final List<String> supportedLanguages = ['en', 'fr', 'es', 'ar'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationProvider>(context,listen: false).getUserCurrentLocation(context);
    Provider.of<LocationProvider>(context,listen: false).location(context);
  }



  @override
  Widget build(BuildContext context) {
    final locationP = Provider.of<LocationProvider>(context,listen: false);
    final languageP = Provider.of<LanguageProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  Center(
                    child: TextWidget(
                        text: languageP.translate("Choose Location"), fontSize: 24,
                        fontWeight: FontWeight.w600, isTextCenter: false,
                        textColor: textColor),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: TextWidget(
                        text: languageP.translate("Choose your location for near hospitals"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400, isTextCenter: false,
                        textColor: textColor),
                  ),
                  const SizedBox(height: 20,),
                  TextWidget(
                      text: languageP.translate("Country"), fontSize: 21,
                      fontWeight: FontWeight.w500, isTextCenter: false,
                      textColor: textColor,fontFamily: "Medium",),
                  const SizedBox(height: 10,),
                  Consumer<LocationProvider>(
                    builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        showCountryPicker(
                          moveAlongWithKeyboard: true,
                          context: context,
                          showPhoneCode: false, // Do not show the phone code
                          onSelect: (Country country) {
                            log('Selected country: ${country.name}');
                            value.selectCountryName(country.name);
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 9.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: themeColor,
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: value.countryName, fontSize: 16, fontWeight: FontWeight.w600,
                              isTextCenter: false, textColor: textColor,fontFamily: "Medium",),
                            SvgPicture.asset(AppIcons.downArrowIcon,height: 35,)
                          ],
                        ),
                      ),
                    );
                  },),
                  const SizedBox(height: 10,),
                  TextWidget(
                      text: languageP.translate("Address"), fontSize: 21,
                      fontWeight: FontWeight.w500, isTextCenter: false,
                      textColor: textColor,fontFamily: "Medium",),
                  const SizedBox(height: 10,),
                  const SearchLocationField(),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 100.w,
              height: 40.h,
              child: const GoogleMapSection(),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SubmitButton(
                title: languageP.translate("Next"),
                press: () {
                  if(locationP.countryName.isNotEmpty){
                    Get.to(()=>const AccountTypeScreen());
                  }else{
                    Get.snackbar("Error!", "Please Select Country");
                  }
                },),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
