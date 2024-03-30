import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class OrderButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const OrderButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      decoration: BoxDecoration(
        color: AppColors.myBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.myBlack.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          'Order',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.myWhite,
          ),
        ),
      ),
    );
  }
}
