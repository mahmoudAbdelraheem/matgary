import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/order_data.dart';
import '../../data/models/orders/order_model.dart';

abstract class PendingController extends GetxController {
  //? get all user pending orders
  getPendingOrders();
  //? cancle user order
  cancleOrder(String orderId);
  //? refresh orders data when send notification and user in pending order
  refreshPendingOrders();
  //? go to details screen
  goToOrderDetails(OrdersModel model);
}

class PendingControllerImp extends PendingController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final OrderData _orderData = OrderData(crudImp: Get.find());
  List<OrdersModel> orders = [];

  @override
  getPendingOrders() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _orderData.getPendingOrdersData(
        userId: _myServices.sharedPreferences.getString('id')!);
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        orders.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
        orders = orders.reversed.toList();
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  refreshPendingOrders() async {
    orders.clear();
    await getPendingOrders();
  }

  @override
  cancleOrder(String orderId) {
    Get.defaultDialog(
      title: 'Warring',
      middleText: 'Are Yor Sure, You Need To\n Cancle This Order?',
      actions: [
        MaterialButton(
          onPressed: () {
            //? cancle order
            _orderData.canceldOrderData(
              orderId: orderId,
              userId: _myServices.sharedPreferences.getString('id')!,
            );
            orders.removeWhere((e) => e.orderId == orderId);
            update();
            Get.back();
          },
          color: AppColors.myBlue,
          child: Text(
            'Yes',
            style: TextStyle(color: AppColors.myWhite),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors.myRed,
          child: Text(
            'No',
            style: TextStyle(color: AppColors.myWhite),
          ),
        ),
      ],
    );
    update();
  }

  @override
  goToOrderDetails(OrdersModel model) {
    Get.toNamed(AppRoutes.orderDetailsScreen, arguments: {
      'ordermodel': model,
    });
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
