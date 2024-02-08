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
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildHeaderIconWidget(
            icon: Icons.card_travel_outlined,
            borderRadius: BorderRadius.only(
              topLeft: controller.lang == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
              topRight: controller.lang == 'ar'
                  ? const Radius.circular(20)
                  : const Radius.circular(0),
              bottomLeft: controller.lang == 'ar'
                  ? const Radius.circular(20)
                  : const Radius.circular(0),
              bottomRight: controller.lang == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
            ),
            onTap: () {},
          ),
          BuildHeaderIconWidget(
            borderRadius: BorderRadius.only(
              topLeft: controller.lang == 'ar'
                  ? const Radius.circular(20)
                  : const Radius.circular(0),
              topRight: controller.lang == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
              bottomLeft: controller.lang == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
              bottomRight: controller.lang == 'ar'
                  ? const Radius.circular(20)
                  : const Radius.circular(0),
            ),
            icon: controller.favoriteItems.contains(favIndex)
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            onTap: () {
              controller.addAbdRemoveItemToFavorite(favIndex);
            },
          ),
        ],
      ),
    );
  }
}

class BuildHeaderIconWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;

  const BuildHeaderIconWidget({
    super.key,
    required this.icon,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.myBlack.withOpacity(0.2),
        borderRadius: borderRadius,
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
