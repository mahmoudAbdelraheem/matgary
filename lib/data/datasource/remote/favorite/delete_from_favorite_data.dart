import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class DeleteFromFavorite {
  final CrudImp crudImp;
  DeleteFromFavorite({required this.crudImp});

  deleteData({required String favId}) async {
    var response = await crudImp.postData(ApiLink.deleteFromFavorite, {
      'favoriteid': favId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getFavorite({required String userId}) async {
    var response = await crudImp.postData(ApiLink.viewFavorite, {
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
