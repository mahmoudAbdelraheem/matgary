import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class CartData {
  final CrudImp crudImp;

  CartData({required this.crudImp});

  addToCart({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.addToCart, {
      "userid": userId,
      "itemid": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.removeFromCart, {
      "userid": userId,
      "itemid": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCartItems({required String userId}) async {
    var response = await crudImp.postData(ApiLink.viewCart, {
      "id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getItemCount({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.cartGetItemCount, {
      "userid": userId,
      "itemid": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

//? for coupon
  checkCoupone({required String couponName}) async {
    var response = await crudImp.postData(ApiLink.checkCoupone, {
      'couponname': couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
