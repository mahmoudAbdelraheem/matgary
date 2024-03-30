import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

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

  //? get user pending orders
  getPendingOrdersData({required String userId}) async {
    var response = await crudImp.postData(ApiLink.pendingOrder, {
      'id': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  //? get user canceld order
  getCanceldOrdersData({required String userId}) async {
    var response = await crudImp.postData(ApiLink.getCanceldOrder, {
      'id': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  //? get user archived orders
  getArchiveOrdersData({required String userId}) async {
    var response = await crudImp.postData(ApiLink.archiveOrder, {
      'id': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
  //? put user order on archive
  // todo put order in archived by make order status  = 3
  // archiveOrderData({required String userId}) async {
  //   var response = await crudImp.postData(ApiLink.archiveOrder, {
  //     'id': userId,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  //? cancel order
  canceldOrderData({required String orderId, required String userId}) async {
    var response = await crudImp.postData(ApiLink.cancelOrder, {
      'orderid': orderId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  //? get order details
  getOrderDetails({
    required String orderId,
  }) async {
    var response = await crudImp.postData(ApiLink.getOrderDetails, {
      'id': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

  //? rate order
  ratingOrder({
    required String orderId,
    required String rating,
    required String comment,
  }) async {
    var response = await crudImp.postData(ApiLink.rating, {
      'id': orderId,
      'rating': rating,
      'comment': comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
