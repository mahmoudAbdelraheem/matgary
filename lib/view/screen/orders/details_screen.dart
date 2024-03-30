import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/orders/shipping_with_map_widget.dart';
import '../../../controller/orders/details_controller.dart';
import '../../widget/orders/order_items_details_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<OrderDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView(
              children: [
                //? orders details card widget
                OrderItmesDetailsWidget(
                  totalPrice: controller.order.orderPrice!,
                  model: controller.orderDetails,
                ),
                //? shipping address with map
                if (controller.order.orderType == '0')
                  ShippingWithMapWidget(model: controller.order),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
