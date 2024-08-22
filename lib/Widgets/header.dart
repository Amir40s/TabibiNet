import 'package:flutter/cupertino.dart';
import 'package:tabibinet_project/Widgets/text_widget.dart';

import '../Constants/app_fonts.dart';
import '../Constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: themeColor,
                  shape: BoxShape.circle
              ),
              child: const Center(child: Icon(CupertinoIcons.back,color: bgColor,size: 24,)),
            ),
            const SizedBox(width: 15,),
            TextWidget(
              text: text, fontSize: 24,
              fontWeight: FontWeight.w600, isTextCenter: false,
              textColor: textColor,fontFamily: AppFonts.semiBold,),
          ],
        ),
      ),
    );
  }
}
