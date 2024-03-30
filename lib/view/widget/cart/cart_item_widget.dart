import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../apis_link.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/cart_view_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartViewModel model;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CartItemWidget({
    super.key,
    required this.model,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: AppColors.myBlue.withOpacity(0.8),
        shadowColor: AppColors.myGrey,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            //? item image
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${ApiLink.itemsImg}/${model.itemImage}",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? item Name
                  Text(
                    model.itemName!,
                    style: TextStyle(
                      color: AppColors.myWhite,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 50),
                  //? item price
                  Text(
                    '${model.itemTotalPrice}\$',
                    style: TextStyle(
                      color: AppColors.myRed.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            //? increment & decrement item
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  InkWell(
                    onTap: onAdd,
                    child: CircleAvatar(
                      backgroundColor: AppColors.myGrey.withOpacity(0.4),
                      child: Icon(
                        Icons.add,
                        color: AppColors.myWhite,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      model.itemTotalCount!,
                      style: TextStyle(
                        color: AppColors.myWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onRemove,
                    child: CircleAvatar(
                      backgroundColor: AppColors.myGrey.withOpacity(0.4),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.myWhite,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
