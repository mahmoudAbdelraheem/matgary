import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/order_data.dart';
import 'package:matgary/data/models/order_model.dart';

abstract class ArchiveController extends GetxController {
  //? get all user cancled orders
  getArchivedOrders();
}

class ArchiveControllerImp extends ArchiveController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final OrderData _orderData = OrderData(crudImp: Get.find());
  final List<OrdersModel> orders = [];

  @override
  getArchivedOrders() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _orderData.getArchiveOrdersData(
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
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }
}
