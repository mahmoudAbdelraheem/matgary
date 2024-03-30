import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CartItemCountTextWidget extends StatelessWidget {
  final int cartItemsCount;
  const CartItemCountTextWidget({
    super.key,
    this.cartItemsCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.myBlue.withOpacity(0.5),
      ),
      child: Text(
        'You Have $cartItemsCount Items In Your Cart.',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.myWhite,
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
