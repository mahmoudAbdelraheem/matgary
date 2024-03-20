import 'package:flutter/material.dart';
import 'package:matgary/data/models/orders/orders_details_model.dart';

import '../../../core/constant/app_colors.dart';

class OrderItmesDetailsWidget extends StatelessWidget {
  final String totalPrice;
  final List<OrdersDetailsModel> model;
  const OrderItmesDetailsWidget({
    super.key,
    required this.totalPrice,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Table(
              //? table items alingment
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //? table border
              border: TableBorder(
                horizontalInside: BorderSide(
                  width: 1,
                  color: AppColors.myBlue,
                  style: BorderStyle.solid,
                ),
              ),
              children: [
                ///? table header

                TableRow(children: [
                  Text(
                    'Item',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myRed,
                      height: 3,
                    ),
                  ),
                  Text(
                    'Quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myRed,
                      height: 3,
                    ),
                  ),
                  Text(
                    'Price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myRed,
                      height: 3,
                    ),
                  ),
                ]),
                //? table items
                ...List.generate(
                  model.length,
                  (index) => TableRow(
                    children: [
                      Text(
                        model[index].itemName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.myBlack,
                          height: 2,
                        ),
                      ),
                      Text(
                        model[index].itemQuantity!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.myBlack,
                          height: 2,
                        ),
                      ),
                      Text(
                        '${model[index].itemPrice}\$',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.myBlack,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: AppColors.myBlue,
                  thickness: 1,
                ),
                Text(
                  "Total Price : $totalPrice\$",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myRed,
                    height: 3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
