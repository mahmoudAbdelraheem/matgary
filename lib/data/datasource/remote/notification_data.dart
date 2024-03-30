import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class NotificationData {
  final CrudImp crudImp;

  NotificationData({required this.crudImp});
  getData({required String userId}) async {
    var response = await crudImp.postData(ApiLink.getNotification, {
      "id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
