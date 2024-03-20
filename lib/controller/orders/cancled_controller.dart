import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/order_data.dart';
import 'package:matgary/data/models/orders/order_model.dart';

abstract class CancledController extends GetxController {
  //? get all user cancled orders
  getCanceldOrders();
}

class CancledControllerImp extends CancledController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final OrderData _orderData = OrderData(crudImp: Get.find());
  List<OrdersModel> orders = [];

  @override
  getCanceldOrders() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _orderData.getCanceldOrdersData(
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
  void onInit() {
    getCanceldOrders();
    super.onInit();
  }
}
