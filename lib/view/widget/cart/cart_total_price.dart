import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/functions/coupon_text_form.dart';

class TotalPriceTextWidget extends GetView<CartControllerImp> {
  const TotalPriceTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //? coupon
        InkWell(
          onTap: () {
            //? open an aleart dialog to insart coupone
            couponTextForm(controller.couponController, () {
              controller.checkCoupon();
            });
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
        //? total order price
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //? price befor coupon discount
                  if (controller.couponModel != null)
                    Text(
                      '${controller.orderTotalPrice.toStringAsFixed(2)}\$',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.myBlack,
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: AppColors.myRed,
                        decorationThickness: 3,
                      ),
                    ),
                  const SizedBox(width: 10),
                  //? price after coupon discount
                  Text(
                    '${controller.orderTotalDicountPrice.toStringAsFixed(2)}\$',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //? user coupon discount
        if (controller.couponModel != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                  ),
                ),
                Text(
                  '${controller.couponModel!.couponDiscount}%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                  ),
                ),
              ],
            ),
          ),

        //? shipping price
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
                '${controller.orderTotalDicountPrice.toStringAsFixed(2)}\$',
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
