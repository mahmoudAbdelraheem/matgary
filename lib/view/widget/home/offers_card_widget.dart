import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_screen_controller.dart';
import '../../../core/constant/app_colors.dart';

class OffersCardWidget extends StatelessWidget {
  final String title;
  final String body;
  const OffersCardWidget({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const BuildBackgroundCircularWidget(),
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                height: 4,
                color: AppColors.myWhite,
              ),
            ),
            subtitle: Text(
              body,
              style: TextStyle(
                color: AppColors.myWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildBackgroundCircularWidget extends GetView<HomeScreenControllerImp> {
  const BuildBackgroundCircularWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      //? rigth circular
      right: controller.lang == 'en' ? -80 : null,
      left: controller.lang == 'ar' ? -80 : null,
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.myBlue,
          borderRadius: BorderRadius.circular(160),
          boxShadow: [
            BoxShadow(
              color: AppColors.myBlack.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(-10, 10),
            ),
          ],
        ),
      ),
    );
  }
}
