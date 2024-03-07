import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/orders/order_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/shared/custom_app_appbar.dart';
import 'package:matgary/view/widget/orders/custom_order_btn.dart';

class OrdersSceen extends StatelessWidget {
  const OrdersSceen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());
    return GetBuilder<OrderControllerImp>(
      builder: (controller) => HandlingDataView(
        statuseRequest: controller.statuseRequest,
        child: ListView(
          children: [
            //? custom order app bar
            const CustomAppAppBar(title: 'Orders'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: controller.btnData.length,
                  itemBuilder: (_, index) {
                    return CustomOrderBtnWidget(
                      onTap: () {
                        if (index == 0) {
                          //? go to pending & on the way orders
                          controller.goToPendingOrders();
                        } else if (index == 1) {
                          //? go to archived orders
                          controller.goToArchiveOrders();
                        } else if (index == 2) {
                          //? go to canceld order
                          controller.goToCancledOrders();
                        }
                      },
                      title: controller.btnData[index]['title'],
                      icon: controller.btnData[index]['icon'],
                      btnColor: controller.btnData[index]['color'],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
