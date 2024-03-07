import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/notification_data.dart';
import 'package:matgary/data/models/notification_model.dart';

abstract class NotificationController extends GetxController {
  getNotification();
}

class NotificationControllerImp extends NotificationController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final NotificationData _notificationData =
      NotificationData(crudImp: Get.find());
  List<NotificationModel> notifications = [];

  @override
  getNotification() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _notificationData.getData(
        userId: _myServices.sharedPreferences.getString('id')!);
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        notifications
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
        notifications = notifications.reversed.toList();
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
