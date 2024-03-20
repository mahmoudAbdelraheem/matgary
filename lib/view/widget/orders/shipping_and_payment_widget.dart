import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/orders/order_model.dart';

class ShippingAndPaymentWidget extends StatelessWidget {
  final OrdersModel model;
  const ShippingAndPaymentWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Shipping Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.myBlack,
              ),
            ),
          ),
          //? card with drive thru or delrvery with location
          //? card payment method (card /cash)
        ],
      ),
    );
  }
}
