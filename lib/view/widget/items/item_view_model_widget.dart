import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../apis_link.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/items_view_model.dart';
import 'item_grid_tile_footer.dart';
import 'item_grid_tile_header.dart';

class ItemViewModelWidget extends StatelessWidget {
  final ItemsViewModel item;
  final int itemsIndex;
  final void Function()? onTap;
  const ItemViewModelWidget({
    super.key,
    required this.item,
    required this.itemsIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.myBlue.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: GridTile(
          header: ItemGridTileHeader(index: itemsIndex, item: item),
          footer: ItemGridTileFooter(item: item),
          //child: CachedNetworkImage(imageUrl: model.itemImage!),

          child: Hero(
            tag: "${item.itemId}image",
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CachedNetworkImage(
                  imageUrl: '${ApiLink.itemsImg}/${item.itemImage!}'),
            ),
          ),
        ),
      ),
    );
  }
}
