import 'package:flutter/material.dart';
import '../../../core/class/orders.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/orders/order_model.dart';
import 'package:jiffy/jiffy.dart';

class CustomOrderCardWidget extends StatelessWidget {
  final OrdersModel order;
  final bool isPending;
  final void Function()? onCancle;
  final void Function()? onDetails;
  final void Function()? onRating;
  const CustomOrderCardWidget({
    super.key,
    required this.order,
    this.isPending = true,
    this.onCancle,
    this.onDetails,
    this.onRating,
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
            Text(Jiffy.parse(order.orderDateTime!).fromNow()),
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
                  'total Price: ${order.orderTotalPrice}\$',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myRed,
                  ),
                ),

                //? order rating
                order.orderRating == '0'
                    ? MaterialButton(
                        onPressed: onRating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: AppColors.myBlue,
                        textColor: AppColors.myWhite,
                        child: const Text(
                          'Rate',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${order.orderRating}.0',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: AppColors.myBlue,
                            size: 20,
                          ),
                        ],
                      ),
                //? order details
                MaterialButton(
                  onPressed: onDetails,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: AppColors.myBlue,
                  textColor: AppColors.myWhite,
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 12,
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
