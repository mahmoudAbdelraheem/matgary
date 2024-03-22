import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/top_selling_model.dart';

import '../../../apis_link.dart';

class TopSellingCardWidget extends StatelessWidget {
  final TopSellingModel model;
  const TopSellingCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 5,
        shadowColor: AppColors.myGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //? items image
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.myBlue.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
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
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  color: AppColors.myBlue.withOpacity(0.4),
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
                      // Text(
                      //   '${model.itemDiscountPrice}\$',
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //     color: AppColors.myRed,
                      //   ),
                      // ),
                    ],
                  ),
                  //? add itemd to favorate
                  // GetBuilder<FavoriteControllerImp>(
                  //   builder: (favController) => IconButton(
                  //     onPressed: () {
                  //       if (favController.isFavorite[model.itemId] == '1') {
                  //         //? remove item from map
                  //         favController.setFavorite(model.itemId!, '0');
                  //         //? remove item from database
                  //         favController.removeFromFavorite(
                  //             favController.userId, model.itemId!);
                  //       } else {
                  //         //? add item from map
                  //         favController.setFavorite(model.itemId!, '1');
                  //         //? add item from database
                  //         favController.addToFavorite(
                  //             favController.userId, model.itemId!);
                  //       }
                  //     },
                  //     icon: Icon(
                  //       favController.isFavorite[model.itemId] == '1'
                  //           ? Icons.favorite
                  //           : Icons.favorite_border_outlined,
                  //       color: AppColors.myBlue,
                  //       size: 30,
                  //     ),
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: AppColors.myBlue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
