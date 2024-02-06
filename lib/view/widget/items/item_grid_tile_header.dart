import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/items_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';

class ItemGridTileHeader extends StatelessWidget {
  final int favIndex;
  const ItemGridTileHeader({
    super.key,
    required this.favIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildHeaderIconWidget(
          icon: Icons.card_travel_outlined,
          onTap: () {},
        ),
        GetBuilder<ItemsControllerImp>(
          builder: (controller) => BuildHeaderIconWidget(
            icon: controller.favoriteItems.contains(favIndex)
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            isLeftIcon: false,
            onTap: () {
              controller.addAbdRemoveItemToFavorite(favIndex);
            },
          ),
        ),
      ],
    );
  }
}

class BuildHeaderIconWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final bool isLeftIcon;

  const BuildHeaderIconWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.isLeftIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.myBlack.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          //? border for left icon
          topLeft: isLeftIcon == true
              ? const Radius.circular(20)
              : const Radius.circular(0),
          bottomRight: isLeftIcon == true
              ? const Radius.circular(20)
              : const Radius.circular(0),

          //? border for right icon
          topRight: isLeftIcon == false
              ? const Radius.circular(20)
              : const Radius.circular(0),
          bottomLeft: isLeftIcon == false
              ? const Radius.circular(20)
              : const Radius.circular(0),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: AppColors.myWhite,
          size: 30,
        ),
      ),
    );
  }
}
