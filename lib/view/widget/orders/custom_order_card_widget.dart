import 'package:flutter/material.dart';
import 'package:matgary/core/class/orders.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/order_model.dart';

class CustomOrderCardWidget extends StatelessWidget {
  final OrdersModel order;
  final bool isPending;
  final void Function()? onCancle;
  const CustomOrderCardWidget({
    super.key,
    required this.order,
    this.isPending = true,
    this.onCancle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? order number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Number : #${order.orderId}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                  ),
                ),
                //? order will cancle only if status is pending approver
                if (order.orderStatus == '0' && isPending == true)
                  IconButton(
                    onPressed: onCancle,
                    icon: Icon(
                      Icons.cancel_presentation_rounded,
                      color: AppColors.myRed,
                    ),
                  ),
              ],
            ),
            const Divider(thickness: 2),
            //? order payment method
            Text(
              'Payment Method : ${Orders.printPaymentMethod(order.orderPaymentMethod!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order type
            Text(
              'Order type : ${Orders.printOrderType(order.orderType!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order status
            Text(
              'Order Status : ${Orders.printOrderStatus(order.orderStatus!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order price
            Text(
              'Order Price : ${order.orderPrice}\$',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order coupon discount
            if (order.orderCouponDiscount != '0')
              Text(
                'Coupon Discount : ${order.orderCouponDiscount}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                  height: 2,
                ),
              ),
            //? shipping price
            if (order.orderType == '0')
              Text(
                'Delivery Price : ${order.orderShippingPrice}\$',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                  height: 2,
                ),
              ),
            const Divider(thickness: 2),
            //? total price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'total Price : ${order.orderTotalPrice}\$',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myRed,
                  ),
                ),
                //? order details
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: AppColors.myBlue,
                  textColor: AppColors.myWhite,
                  child: const Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
