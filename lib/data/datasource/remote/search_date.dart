import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class SearchItemsData {
  final CrudImp crudImp;

  SearchItemsData({required this.crudImp});
  searchData({required String search}) async {
    var response = await crudImp.postData(ApiLink.itemsSearch, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
