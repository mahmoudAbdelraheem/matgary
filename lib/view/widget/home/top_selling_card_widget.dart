import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:matgary/data/models/top_selling_model.dart';

import '../../../apis_link.dart';

class TopSellingCardWidget extends GetView<HomeScreenControllerImp> {
  final TopSellingModel model;
  const TopSellingCardWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(ItemsViewModel(
          itemId: model.itemId,
          itemName: model.itemName,
          itemNameAr: model.itemNameAr,
          itemDescription: model.itemDescription,
          itemDescriptionAr: model.itemDescriptionAr,
          itemImage: model.itemImage,
          itemCount: model.itemCount,
          itemActive: model.itemActive,
          itemPrice: model.itemPrice,
          itemDiscount: model.itemDiscount,
          itemDateTime: model.itemDateTime,
          itemCategory: model.itemCategory,
          cateId: model.cateName,
          cateName: model.cateName,
          cateNameAr: model.cateNameAr,
          cateImage: model.cateImage,
          cateDateTime: model.cateDateTime,
          itemFavorite: '0',
          itemDiscountPrice: model.itemdiscountprice,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Card(
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
                        const SizedBox(height: 10),
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

                        //? items old and new price
                        Column(
                          children: [
                            if (model.itemDiscount != '0')
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
                              '${model.itemDiscount == '0' ? model.itemPrice : model.itemdiscountprice}\$',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.myRed,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (model.itemDiscount != '0')
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
      ),
    );
  }
}
