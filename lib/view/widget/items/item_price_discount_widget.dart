import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/items_view_model.dart';

class ItemPriceAndDiscountWidget extends StatelessWidget {
  final ItemsViewModel item;
  const ItemPriceAndDiscountWidget({
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
            fontSize: item.itemDiscount != '0' ? 14 : 16,
            fontWeight: item.itemDiscount == '0' ? FontWeight.bold : null,
            color: AppColors.myWhite,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.myWhite,
              height: 1,
            ),
          ),
      ],
    );
  }
}
