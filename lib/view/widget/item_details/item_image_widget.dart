import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../apis_link.dart';
import '../../../controller/item_details_controller.dart';
import '../../../core/constant/app_colors.dart';

class ItemImageWidget extends GetView<ItemDetailsControllerImp> {
  const ItemImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: AppColors.myBlue,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Hero(
              tag: "${controller.item.itemId}image",
              child: CachedNetworkImage(
                imageUrl: '${ApiLink.itemsImg}/${controller.item.itemImage!}',
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
