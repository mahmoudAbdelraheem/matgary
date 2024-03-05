import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/order_data.dart';
import 'package:matgary/data/models/order_model.dart';

abstract class PendingController extends GetxController {
  String printPaymentMethod(String val);
  String printOrderType(String val);
  String printOrderStatus(String val);
  //? get all user pending orders
  getPendingOrders();
  //? cancle user order
  cancleOrder(String orderId);
}

class PendingControllerImp extends PendingController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final OrderData _orderData = OrderData(crudImp: Get.find());
  final List<OrdersModel> orders = [];

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
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
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
  String printPaymentMethod(String val) {
    if (val == '0') {
      return "Card Payment";
    } else {
      return "Cash Payment";
    }
  }

  @override
  String printOrderType(String val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  @override
  String printOrderStatus(String val) {
    if (val == '0') {
      return "Pending Approval";
    } else {
      return "On The Way";
    }
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
