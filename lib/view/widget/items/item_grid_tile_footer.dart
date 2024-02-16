import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/functions/translate_database.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:matgary/view/widget/items/item_price_discount_widget.dart';

class ItemGridTileFooter extends StatelessWidget {
  final ItemsViewModel item;
  const ItemGridTileFooter({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.myBlack.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BuildFooterTextWidget(
              text: translateDatabase(item.itemName!, item.itemNameAr!),
            ),
          ),
          const SizedBox(width: 5),
          ItemPriceAndDiscountWidget(item: item),
        ],
      ),
    );
  }
}

class BuildFooterTextWidget extends StatelessWidget {
  final String text;
  const BuildFooterTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //? if text is title (font =14) else text is price (font 16)
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.myWhite,
        height: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
