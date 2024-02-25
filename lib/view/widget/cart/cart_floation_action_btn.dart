import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/cart_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/cart/cart_order_btn.dart';
import 'package:matgary/view/widget/cart/cart_total_price.dart';

class CartFloatingActionBtnWidget extends StatelessWidget {
  const CartFloatingActionBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        height: controller.isOpen ? 310 : 110,
        decoration: BoxDecoration(
          color: controller.isOpen ? AppColors.myWhite : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                controller.changeContainerHeigth();
              },
              child: CircleAvatar(
                backgroundColor: controller.isOpen
                    ? AppColors.myWhite
                    : AppColors.myBlack.withOpacity(0.6),
                child: Icon(
                  controller.isOpen
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_drop_up_rounded,
                  color:
                      controller.isOpen ? AppColors.myBlack : AppColors.myWhite,
                ),
              ),
            ),
            //? text
            FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 700)),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return controller.isOpen
                      ? const TotalPriceTextWidget()
                      : Container();
                } else {
                  return Container();
                }
              },
            ),
            const OrderButtonWidget(),
          ],
        ),
      ),
    );
  }
}
