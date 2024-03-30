import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/order_data.dart';
import '../../data/models/orders/order_model.dart';

import '../../core/constant/routes.dart';

abstract class ArchiveController extends GetxController {
  //? get all user cancled orders
  getArchivedOrders();
  goToOrderDetails(OrdersModel model);
  //? submit order rating
  submitOrderRating(String orderId, double rate, String comment);
}

class ArchiveControllerImp extends ArchiveController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final OrderData _orderData = OrderData(crudImp: Get.find());
  List<OrdersModel> orders = [];

  @override
  getArchivedOrders() async {
    orders.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _orderData.getArchiveOrdersData(
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
  goToOrderDetails(OrdersModel model) {
    Get.toNamed(AppRoutes.orderDetailsScreen, arguments: {
      'ordermodel': model,
    });
  }

  @override
  submitOrderRating(String orderId, double rate, String comment) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _orderData.ratingOrder(
      orderId: orderId,
      rating: rate.toString(),
      comment: comment,
    );
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        getArchivedOrders();
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }
}
