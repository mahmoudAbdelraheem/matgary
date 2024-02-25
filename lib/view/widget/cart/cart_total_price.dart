import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/cart_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/shared/custom_app_text_form.dart';

class TotalPriceTextWidget extends GetView<CartControllerImp> {
  const TotalPriceTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            //? open an aleart dialog to insart coupone

            Get.defaultDialog(
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
                  myController: controller.couponController,
                  myKeyboardType: TextInputType.text,
                ),
              ),
              buttonColor: AppColors.myBlue,
              confirmTextColor: AppColors.myWhite,

              //?
              onConfirm: () {
                //? check user coupon from data base
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.myBlue,
            ),
            child: Text(
              'Have An Coupone ?',
              style: TextStyle(
                color: AppColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                ),
              ),
              Text(
                '${controller.orderTotalPrice}\$',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                ),
              ),
              Text(
                '0\$',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myRed.withOpacity(0.7),
                ),
              ),
              Text(
                '${controller.orderTotalPrice}\$',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myRed.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
