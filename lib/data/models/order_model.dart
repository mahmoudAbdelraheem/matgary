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
      this.orderDateTime});

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
    return data;
  }
}
