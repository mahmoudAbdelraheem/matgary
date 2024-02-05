class CategoriesModel {
  String id;
  String name;
  String nameAr;
  String image;
  String dateTime;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.image,
    required this.dateTime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['cate_id'],
      name: json['cate_name'],
      nameAr: json['cate_name_ar'],
      image: json['cate_image'],
      dateTime: json['cate_date_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cate_id'] = id;
    data['cate_name'] = name;
    data['cate_name_ar'] = nameAr;
    data['cate_image'] = image;
    data['cate_date_time'] = dateTime;
    return data;
  }
}

//! nallable model
// class CategoriesModel {
//   String? id;
//   String? name;
//   String? nameAr;
//   String? image;
//   String? dateTime;

//   CategoriesModel({this.id, this.name, this.nameAr, this.image, this.dateTime});

//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     nameAr = json['name_ar'];
//     image = json['image'];
//     dateTime = json['date_time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['name_ar'] = this.nameAr;
//     data['image'] = this.image;
//     data['date_time'] = this.dateTime;
//     return data;
//   }
// }
