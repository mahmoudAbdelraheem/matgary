import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class ItemsViewData {
  final CrudImp crudImp;

  ItemsViewData({required this.crudImp});

  getItemsViewDate({required String categoryId, required String userId}) async {
    var response = await crudImp.postData(ApiLink.itemsView, {
      'id': categoryId.toString(),
      'userid': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
