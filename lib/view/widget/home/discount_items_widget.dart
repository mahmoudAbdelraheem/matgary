import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DiscountItemsWidget extends GetView<HomeScreenControllerImp> {
  final void Function()? onTap;
  const DiscountItemsWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, i) => const SizedBox(width: 10),
          itemCount: controller.items.length,
          itemBuilder: (_, index) {
            return Item(
              item: ItemsViewModel.fromJson(
                controller.items[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final ItemsViewModel item;
  const Item({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 200,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.myBlue.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            imageUrl: ('${ApiLink.itemsImg}/${item.itemImage}'),
          ),
        ),
        Container(
          width: 200,
          height: 150,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: AppColors.myBlack.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.bottomCenter,
          child: Text(
            "Discount  ${item.itemDiscount}%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.myWhite,
            ),
          ),
        ),
      ],
    );
  }
}
