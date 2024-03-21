import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/favorite/favorite_controller.dart';
import 'package:matgary/data/models/items_view_model.dart';

import '../../apis_link.dart';
import '../../core/constant/app_colors.dart';

class CustomOffersCardWidget extends StatelessWidget {
  final void Function()? onDetails;
  final ItemsViewModel model;
  const CustomOffersCardWidget({
    super.key,
    required this.model,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetails,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //? items image
                Hero(
                  tag: "${model.itemId}image",
                  child: CachedNetworkImage(
                    imageUrl: '${ApiLink.itemsImg}/${model.itemImage}',
                    height: 200,
                  ),
                ),
                //?items name
                Text(
                  model.itemName!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.myBlue.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //? items old and new price
                      Column(
                        children: [
                          Text(
                            '${model.itemPrice}\$',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.myGrey,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 3,
                              decorationColor: AppColors.myRed,
                            ),
                          ),
                          Text(
                            '${model.itemDiscountPrice}\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.myRed,
                            ),
                          ),
                        ],
                      ),
                      //? add itemd to favorate
                      GetBuilder<FavoriteControllerImp>(
                        builder: (favController) => IconButton(
                          onPressed: () {
                            if (favController.isFavorite[model.itemId] == '1') {
                              //? remove item from map
                              favController.setFavorite(model.itemId!, '0');
                              //? remove item from database
                              favController.removeFromFavorite(
                                  favController.userId, model.itemId!);
                            } else {
                              //? add item from map
                              favController.setFavorite(model.itemId!, '1');
                              //? add item from database
                              favController.addToFavorite(
                                  favController.userId, model.itemId!);
                            }
                          },
                          icon: Icon(
                            model.itemFavorite == "0"
                                ? Icons.favorite_border_outlined
                                : Icons.favorite,
                            color: AppColors.myBlue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.myRed,
              child: Text(
                "${model.itemDiscount}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.myWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
