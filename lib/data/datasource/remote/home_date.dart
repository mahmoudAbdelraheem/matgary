import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class HomeData {
  final CrudImp crudImp;

  HomeData({required this.crudImp});
  getData() async {
    var response = await crudImp.postData(ApiLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
