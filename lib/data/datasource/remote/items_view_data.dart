import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class ItemsViewData {
  final CrudImp crudImp;

  ItemsViewData({required this.crudImp});

  getItemsViewDate({required String categoryId}) async {
    var response = await crudImp.postData(ApiLink.itemsView, {
      'id': categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
