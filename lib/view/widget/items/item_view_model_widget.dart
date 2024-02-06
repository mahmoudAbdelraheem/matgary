import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:matgary/view/widget/items/item_grid_tile_footer.dart';
import 'package:matgary/view/widget/items/item_grid_tile_header.dart';

class ItemViewModelWidget extends StatelessWidget {
  final ItemsViewModel item;
  final int itemsIndex;
  const ItemViewModelWidget({
    super.key,
    required this.item,
    required this.itemsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridTile(
        header: ItemGridTileHeader(favIndex: itemsIndex),
        footer: ItemGridTileFooter(item: item),
        //child: CachedNetworkImage(imageUrl: model.itemImage!),

        child: CachedNetworkImage(
            imageUrl: '${ApiLink.itemsImg}/${item.itemImage!}'),
      ),
    );
  }
}
