import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_colors.dart';
import '../shared/custom_app_text_form.dart';

couponTextForm(TextEditingController controller, void Function()? confirm) {
  return Get.defaultDialog(
    title: 'Coupon',
    //? text form feild
    content: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomAppTextForm(
        labelText: 'Coupon',
        hintText: 'Enter Your Coupone',
        sufixIcon: Icons.discount_outlined,
        myValidator: (val) {
          return null;
        },
        myController: controller,
        myKeyboardType: TextInputType.text,
      ),
    ),
    buttonColor: AppColors.myBlue,
    confirmTextColor: AppColors.myWhite,

    //?
    onConfirm: confirm,
  );
}
