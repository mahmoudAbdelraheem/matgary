import '../../../../apis_link.dart';
import '../../../../core/class/crud.dart';

class FavoriteItemData {
  final CrudImp crudImp;

  FavoriteItemData({required this.crudImp});

  addItemToFavorite({required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.addToFavorite, {
      'userid': userId,
      'itemid': itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  removeItemFromFavorite(
      {required String userId, required String itemId}) async {
    var response = await crudImp.postData(ApiLink.removeFromFavorite, {
      'userid': userId,
      'itemid': itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewFavorite({required String userId}) async {
    var response = await crudImp.postData(ApiLink.viewFavorite, {
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
