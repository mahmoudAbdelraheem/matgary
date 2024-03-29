import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/item_details_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/item_details/custom_item_price_icon.dart';
import 'package:matgary/view/widget/item_details/item_price_and_discount.dart';

class CustomItemQuantityWidget extends GetView<ItemDetailsControllerImp> {
  const CustomItemQuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //? item price and discount
          ItemPriceAndDiscount(item: controller.item),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomItemPriceIcon(
                icon: Icons.add,
                onTap: () {
                  controller.add();
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 2,
                    color: AppColors.myBlack,
                  ),
                ),
                //? item quantity (count)
                child: GetBuilder<ItemDetailsControllerImp>(
                  builder: (controller) => Text(
                    '${controller.itemCount}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CustomItemPriceIcon(
                icon: Icons.remove,
                onTap: () {
                  controller.remove();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
