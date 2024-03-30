import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis_link.dart';
import '../../controller/home_screen_controller.dart';
import '../../core/constant/app_colors.dart';
import '../../data/models/items_view_model.dart';

class ItemsSearchResultWidget extends GetView<HomeScreenControllerImp> {
  final List<ItemsViewModel> result;
  const ItemsSearchResultWidget({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: result.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            //?
            controller.goToItemDetails(result[index]);
          },
          child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: AppColors.myBlue.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  //? item image
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.myBlack.withOpacity(0.3),
                      ),
                      child: Hero(
                        tag: "${result[index].itemId}image",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiLink.itemsImg}/${result[index].itemImage}",
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //? item name and category Name
                          Text(
                            result[index].itemName!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.myWhite,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                result[index].cateName!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.myWhite,
                                  height: 1,
                                ),
                              ),

                              //? item price and discount price

                              Column(
                                children: [
                                  Text(
                                    "${result[index].itemPrice}\$",
                                    style: TextStyle(
                                      fontSize:
                                          result[index].itemDiscount == '0'
                                              ? 18
                                              : 16,
                                      fontWeight: FontWeight.bold,
                                      color: result[index].itemDiscount == '0'
                                          ? AppColors.myRed
                                          : AppColors.myGrey,
                                      decoration:
                                          result[index].itemDiscount == '0'
                                              ? null
                                              : TextDecoration.lineThrough,
                                      decorationThickness: 3,
                                    ),
                                  ),
                                  if (result[index].itemDiscount != '0')
                                    Text(
                                      "${result[index].itemDiscountPrice}\$",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.myRed,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
