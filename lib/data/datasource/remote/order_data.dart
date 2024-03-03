import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class OrderData {
  final CrudImp crudImp;

  OrderData({required this.crudImp});

  addOrderDate({
    required String userId,
    required String userAddress,
    required String orderType,
    required String paymentMethod,
    required String shippingPrice,
    required String orderPrice,
    required String couponId,
    required String couponDiscount,
  }) async {
    var response = await crudImp.postData(ApiLink.addOrder, {
      'userid': userId,
      'useraddress': userAddress,
      'ordertype': orderType,
      'paymentmethod': paymentMethod,
      'shippingprice': shippingPrice,
      'orderprice': orderPrice,
      'couponid': couponId,
      'coupondiscount': couponDiscount,
    });
    return response.fold((l) => l, (r) => r);
  }
}
