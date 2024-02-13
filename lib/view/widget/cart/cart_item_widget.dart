import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/app_image_assets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
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
                child: Image.asset(AppImageAssets.logo),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? item Name
                  Text(
                    'item name',
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
                    '1520\$',
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
                    onTap: () {},
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
                      '5',
                      style: TextStyle(
                        color: AppColors.myWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
