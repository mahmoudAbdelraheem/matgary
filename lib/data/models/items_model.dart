class ItemsModel {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  String? count;
  String? active;
  String? price;
  String? discount;
  String? dateTime;
  String? itemCategory;

  ItemsModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.image,
      this.count,
      this.active,
      this.price,
      this.discount,
      this.dateTime,
      this.itemCategory});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    count = json['count'];
    active = json['active'];
    price = json['price'];
    discount = json['discount'];
    dateTime = json['date_time'];
    itemCategory = json['item_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['count'] = count;
    data['active'] = active;
    data['price'] = price;
    data['discount'] = discount;
    data['date_time'] = dateTime;
    data['item_category'] = itemCategory;
    return data;
  }
}
