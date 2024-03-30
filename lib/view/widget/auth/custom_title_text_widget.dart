import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_colors.dart';

class CustomTitleTextWidget extends StatelessWidget {
  final String title;
  const CustomTitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        title.tr,
        style: TextStyle(
          fontSize: 30,
          color: AppColors.myBlack,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
