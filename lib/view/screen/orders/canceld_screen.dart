import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/orders/cancled_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/view/widget/orders/custom_order_card_widget.dart';

class CanceldScreen extends StatelessWidget {
  const CanceldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CancledControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Canceld Orders')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<CancledControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.orders.length,
              itemBuilder: (_, index) => CustomOrderCardWidget(
                order: controller.orders[index],
                isPending: false,
                onDetails: () {
                  controller.goToOrderDetails(controller.orders[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
