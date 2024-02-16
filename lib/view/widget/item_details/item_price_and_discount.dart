import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/items_view_model.dart';

class ItemPriceAndDiscount extends StatelessWidget {
  final ItemsViewModel item;
  const ItemPriceAndDiscount({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${item.itemPrice!}\$',
          style: TextStyle(
            //? if text is title (font =14) else text is price (font 16)
            fontSize: item.itemDiscount != '0' ? 22 : 24,
            fontWeight: item.itemDiscount == '0' ? FontWeight.bold : null,
            color: AppColors.myRed.withOpacity(0.7),
            height: 2,
            decoration:
                item.itemDiscount == '0' ? null : TextDecoration.lineThrough,
            decorationThickness: item.itemDiscount == '0' ? null : 5,
            decorationColor: item.itemDiscount == '0' ? null : AppColors.myBlue,
          ),
        ),
        if (item.itemDiscount != '0')
          Text(
            '${item.itemDiscountPrice!}\$',
            style: TextStyle(
              //? if text is title (font =14) else text is price (font 16)
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.myRed.withOpacity(0.7),
              height: 1,
            ),
          ),
      ],
    );
  }
}
