class OrdersDetailsModel {
  String? itemprice;
  String? itemQuantity;
  String? cartId;
  String? cartUserId;
  String? cartItemId;
  String? cartOrderId;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemDateTime;
  String? itemCategory;

  OrdersDetailsModel(
      {this.itemprice,
      this.itemQuantity,
      this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartOrderId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescription,
      this.itemDescriptionAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDateTime,
      this.itemCategory});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemprice = json['itemprice'];
    itemQuantity = json['itemcount'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartOrderId = json['cart_order_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDateTime = json['item_date_time'];
    itemCategory = json['item_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemprice'] = itemprice;
    data['itemcount'] = itemQuantity;
    data['cart_id'] = cartId;
    data['cart_user_id'] = cartUserId;
    data['cart_item_id'] = cartItemId;
    data['cart_order_id'] = cartOrderId;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_description'] = itemDescription;
    data['item_description_ar'] = itemDescriptionAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date_time'] = itemDateTime;
    data['item_category'] = itemCategory;
    return data;
  }
}
