import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class CartData {
  final CrudImp crudImp;

  CartData({required this.crudImp});

  addToCart({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.addToCart, {
      "userid": userId,
      "itemid": itemId,
    });
    response.fold((l) => l, (r) => r);
  }

  removeFromCart({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.removeFromCart, {
      "userid": userId,
      "itemid": itemId,
    });
    response.fold((l) => l, (r) => r);
  }
}
