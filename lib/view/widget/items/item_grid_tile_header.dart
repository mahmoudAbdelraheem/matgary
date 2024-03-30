import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favorite/favorite_controller.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/items_view_model.dart';

class ItemGridTileHeader extends StatelessWidget {
  final int index;
  final ItemsViewModel item;
  const ItemGridTileHeader({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
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
              color: AppColors.myBlack.withOpacity(0.2),
            ),
            child: GetBuilder<ItemsControllerImp>(
              builder: (itemController) => InkWell(
                onTap: () {
                  itemController.addItemToCart(item.itemId!);
                },
                child: Icon(
                  //?Icons.shopping_cart
                  Icons.add_shopping_cart_outlined,
                  size: 30,
                  color: AppColors.myWhite,
                ),
              ),
            ),
          ),
          GetBuilder<FavoriteControllerImp>(
            builder: (favController) => Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.myBlack.withOpacity(0.2),
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
              ),
              child: InkWell(
                onTap: () {
                  if (favController.isFavorite[item.itemId] == '1') {
                    //? remove item from map
                    favController.setFavorite(item.itemId!, '0');
                    //? remove item from database
                    favController.removeFromFavorite(
                        favController.userId, item.itemId!);
                  } else {
                    //? add item from map
                    favController.setFavorite(item.itemId!, '1');
                    //? add item from database
                    favController.addToFavorite(
                        favController.userId, item.itemId!);
                  }
                },
                child: Icon(
                  favController.isFavorite[item.itemId] == '1'
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: AppColors.myWhite,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
