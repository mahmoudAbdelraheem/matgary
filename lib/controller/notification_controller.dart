import 'package:get/get.dart';
import '../core/class/statuse_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/notification_data.dart';
import '../data/models/notification_model.dart';

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
