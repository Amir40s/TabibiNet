import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/Constants/colors.dart';
import 'package:tabibinet_project/Constants/images_path.dart';
import 'package:tabibinet_project/Providers/BottomNav/bottom_navbar_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);

    return BottomAppBar(
      color: themeColor,
      height: 100,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(context, IconsPath.bottom_1, 0),
            buildNavItem(context, IconsPath.bottom_2, 1),
            const SizedBox(width: 48), // Space for FAB
            buildNavItem(context, IconsPath.bottom_3, 2),
            buildNavItem(context, IconsPath.bottom_4, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(BuildContext context, String icon, int index) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final isSelected = provider.currentIndex == index;

    return GestureDetector(
      onTap: () {
        provider.setIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? textColor : bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          icon,
          color: isSelected ? bgColor : themeColor,
          height: 15,
        ),
      ),
    );
  }
}