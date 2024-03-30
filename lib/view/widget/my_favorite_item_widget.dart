import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../apis_link.dart';
import '../../core/constant/app_colors.dart';
import '../../data/models/my_favorite_model.dart';

class MyFavoriteItemWidget extends StatelessWidget {
  final MyFavoriteModel item;
  final void Function()? onDelete;
  const MyFavoriteItemWidget({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          //? item image
          BuildFavoriteItemImage(imageUrl: item.itemImage!),
          //? item name and price
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                padding: const EdgeInsets.all(8),
                //color: AppColors.myWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    Text(
                      '${item.itemPrice!}\$',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              //? delete item icon
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.myGrey.withOpacity(0.4),
                child: IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 35,
                    color: AppColors.myWhite,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildFavoriteItemImage extends StatelessWidget {
  final String imageUrl;
  const BuildFavoriteItemImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.myGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: '${ApiLink.itemsImg}/$imageUrl',
        height: 180,
        width: 180,
      ),
    );
  }
}
