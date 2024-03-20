class OrdersModel {
  String? orderId;
  String? orderUserId;
  String? orderUserAddress;
  String? orderType;
  String? orderPaymentMethod;
  String? orderShippingPrice;
  String? orderPrice;
  String? orderTotalPrice;
  String? orderStatus;
  String? orderCoupon;
  String? orderCouponDiscount;
  String? orderDateTime;
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.orderId,
      this.orderUserId,
      this.orderUserAddress,
      this.orderType,
      this.orderPaymentMethod,
      this.orderShippingPrice,
      this.orderPrice,
      this.orderTotalPrice,
      this.orderStatus,
      this.orderCoupon,
      this.orderCouponDiscount,
      this.orderDateTime,
      this.addressId,
      this.addressUserId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderUserAddress = json['order_user_address'];
    orderType = json['order_type'];
    orderPaymentMethod = json['order_payment_method'];
    orderShippingPrice = json['order_shipping_price'];
    orderPrice = json['order_price'];
    orderTotalPrice = json['order_total_price'];
    orderStatus = json['order_status'];
    orderCoupon = json['order_coupon'];
    orderCouponDiscount = json['order_coupon_discount'];
    orderDateTime = json['order_date_time'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_user_id'] = orderUserId;
    data['order_user_address'] = orderUserAddress;
    data['order_type'] = orderType;
    data['order_payment_method'] = orderPaymentMethod;
    data['order_shipping_price'] = orderShippingPrice;
    data['order_price'] = orderPrice;
    data['order_total_price'] = orderTotalPrice;
    data['order_status'] = orderStatus;
    data['order_coupon'] = orderCoupon;
    data['order_coupon_discount'] = orderCouponDiscount;
    data['order_date_time'] = orderDateTime;
    data['address_id'] = addressId;
    data['address_user_id'] = addressUserId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
