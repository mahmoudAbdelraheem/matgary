import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class OffersData {
  final CrudImp crudImp;

  OffersData({required this.crudImp});
  getData() async {
    var response = await crudImp.postData(ApiLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
