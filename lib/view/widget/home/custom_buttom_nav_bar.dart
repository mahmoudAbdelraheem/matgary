import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/home/custom_button_app_bar.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => BottomAppBar(
        color: AppColors.myBlue.withOpacity(0.5),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.pageList.length + 1,
              (index) {
                int pageIndex = index > 2 ? index - 1 : index;
                if (index == 2) {
                  return const Spacer();
                }
                return CustomButtonAppBar(
                  onPressed: () {
                    controller.changePage(pageIndex);
                  },
                  icon: controller.navBarData[pageIndex]['icon'],
                  title: controller.navBarData[pageIndex]['title'],
                  isActive: controller.pageIndex == pageIndex ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
