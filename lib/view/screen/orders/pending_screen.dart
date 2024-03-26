import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/orders/pending_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/view/widget/orders/custom_order_card_widget.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Orders')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<PendingControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.orders.length,
              itemBuilder: (_, index) {
                return CustomOrderCardWidget(
                  order: controller.orders[index],
                  onCancle: () {
                    controller.cancleOrder(controller.orders[index].orderId!);
                  },
                  //? go to details screen
                  onDetails: () {
                    controller.goToOrderDetails(controller.orders[index]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
