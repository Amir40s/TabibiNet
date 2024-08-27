import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/Location/location_provider.dart';
import 'package:tabibinet_project/Screens/StartScreens/AccountTypeScreen/account_type_screen.dart';

import '../../../constant.dart';
import '../../../model/res/constant/app_assets.dart';
import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/submit_button.dart';
import '../../../model/res/widgets/text_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  const Center(
                    child: TextWidget(
                        text: "Choose Location", fontSize: 24,
                        fontWeight: FontWeight.w600, isTextCenter: false,
                        textColor: textColor),
                  ),
                  const SizedBox(height: 10,),
                  const Center(
                    child: TextWidget(
                        text: "Choose your location for near hospitals", fontSize: 14,
                        fontWeight: FontWeight.w400, isTextCenter: false,
                        textColor: textColor),
                  ),
                  const SizedBox(height: 20,),
                  const TextWidget(
                      text: "Country", fontSize: 21,
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
                            print('Selected country: ${country.name}');
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
                  const TextWidget(
                      text: "Address", fontSize: 21,
                      fontWeight: FontWeight.w500, isTextCenter: false,
                      textColor: textColor,fontFamily: "Medium",),
                  const SizedBox(height: 10,),
                  Container(
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
                        SizedBox(
                          width: 65.w,
                          child: const TextWidget(
                              text: "House no 2, Street 3, Morocco Towers.",
                              fontSize: 16, fontWeight: FontWeight.w600,maxLines: 1,
                              isTextCenter: false, textColor: textColor,fontFamily: "Medium",),
                        ),
                        SvgPicture.asset(AppIcons.radioIcon,height: 35,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 100.w,
              height: 40.h,
              child: SvgPicture.asset(AppAssets.googleMap,fit: BoxFit.cover,),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SubmitButton(
                title: "Next",
                press: () {
                  Get.to(()=>const AccountTypeScreen());
                },),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
