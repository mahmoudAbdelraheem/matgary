class ItemsViewModel {
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
  String? cateId;
  String? cateName;
  String? cateNameAr;
  String? cateImage;
  String? cateDateTime;
  String? itemFavorite;

  ItemsViewModel({
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
    this.itemCategory,
    this.cateId,
    this.cateName,
    this.cateNameAr,
    this.cateImage,
    this.cateDateTime,
    this.itemFavorite,
  });

  ItemsViewModel.fromJson(Map<String, dynamic> json) {
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
    cateId = json['cate_id'];
    cateName = json['cate_name'];
    cateNameAr = json['cate_name_ar'];
    cateImage = json['cate_image'];
    cateDateTime = json['cate_date_time'];
    itemFavorite = json['favorite_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['cate_id'] = cateId;
    data['cate_name'] = cateName;
    data['cate_name_ar'] = cateNameAr;
    data['cate_image'] = cateImage;
    data['cate_date_time'] = cateDateTime;
    data['favorite_item'] = itemFavorite;
    return data;
  }
}
