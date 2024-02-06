import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/items_view_model.dart';

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
      height: 55,
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
          Expanded(child: BuildFooterTextWidget(text: item.itemName!)),
          const SizedBox(width: 5),
          BuildFooterTextWidget(text: '${item.itemPrice}\$', isTitle: false),
        ],
      ),
    );
  }
}

class BuildFooterTextWidget extends StatelessWidget {
  final String text;
  final bool isTitle;
  const BuildFooterTextWidget({
    super.key,
    required this.text,
    this.isTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //? if text is title (font =14) else text is price (font 16)
        fontSize: isTitle == true ? 14 : 16,
        fontWeight: FontWeight.bold,
        color: AppColors.myWhite,
      ),
      maxLines: isTitle == true ? 2 : null,
      overflow: isTitle == true ? TextOverflow.ellipsis : null,
    );
  }
}
