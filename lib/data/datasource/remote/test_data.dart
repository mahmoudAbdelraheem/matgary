import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class TestData {
  final CrudImp crudImp;

  TestData({required this.crudImp});
  getData() async {
    var response = await crudImp.postData(ApiLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
