import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tabibinet_project/Providers/FaqProvider/faq_provider.dart';
import 'package:tabibinet_project/model/data/faq_model.dart';

import '../../../../constant.dart';
import '../../../../model/res/constant/app_fonts.dart';
import '../../../../model/res/constant/app_icons.dart';
import '../../../../model/res/widgets/dotted_line.dart';
import '../../../../model/res/widgets/text_widget.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});


  @override
  Widget build(BuildContext context) {

    double height1 = 20;
    final provider = Provider.of<FaqProvider>(context,listen: false);

    return StreamBuilder<List<FaqModel>>(
      stream: provider.fetchFaq(),
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
        final faqs = snapshot.data!;

        return Consumer<FaqProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final isSelected = value.selectFaq == index;
                final faq = faqs[index];
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    value.setFaq(index);
                    if(isSelected){
                      value.setFaq(null);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isSelected ? greenColor
                                : greyColor)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: TextWidget(
                                text: faq.question, fontSize: 14, maxLines: 2,
                                fontWeight: FontWeight.w600, isTextCenter: false,
                                textColor: textColor, fontFamily: AppFonts.semiBold,),
                            ),
                            SvgPicture.asset(
                              isSelected ? AppIcons.caretUpIcon
                                  : AppIcons.caretDownIcon,
                              height: 3.h,)
                          ],
                        ),
                        Visibility(
                            visible: isSelected,
                            child: SizedBox(height: height1,)),
                        Visibility(
                            visible: isSelected,
                            child: const DottedLine(color: greyColor,)),
                        Visibility(
                            visible: isSelected,
                            child: SizedBox(height: height1,)),
                        Visibility(
                          visible: isSelected,
                          child: TextWidget(
                            text: faq.answer,
                            fontSize: 12, fontWeight: FontWeight.w400,
                            isTextCenter: false, textColor: textColor, maxLines: 2,),
                        )

                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height1,);
              },
            );
          },);
      },);
  }
}


//  final List<Map<String, String>> faq = [
//     {
//       'ques': 'What is TabibiNet ?',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//     {
//       'ques': 'How to use TabibiNet ?',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//     {
//       'ques': 'How to schedule consultation on TabibiNet?',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//     {
//       'ques': 'How to logout from TabibiNet ?',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//     {
//       'ques': 'Is there a free tips to get health in this app',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//     {
//       'ques': 'Is TabibiNet free to use?',
//       'ans': 'TabibiNet is greatest medical online consultation app platform in this century',
//     },
//   ];