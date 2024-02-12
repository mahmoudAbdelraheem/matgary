import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/favorite/delete_from_favorite_data.dart';
import 'package:matgary/data/models/my_favorite_model.dart';

abstract class MyFavoriteController extends GetxController {
  //? get user
  getUserFavorite(String userId);
  //? delete item from favorite
  deleteItemFromFavorite(String favId);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  late String userId;
  final MyServices _myServices = Get.find();

  //? list of my favorite model
  List<MyFavoriteModel> myFavorite = [];
  //?
  final DeleteFromFavorite _deleteFromFavorite =
      DeleteFromFavorite(crudImp: Get.find());

  @override
  deleteItemFromFavorite(String favId) {
    _deleteFromFavorite.deleteData(favId: favId);
    myFavorite.removeWhere((element) => element.favoriteId == favId);
    update();
  }

  @override
  getUserFavorite(String userId) async {
    myFavorite.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _deleteFromFavorite.getFavorite(
      userId: userId,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        myFavorite.addAll(
            responseData.map((model) => MyFavoriteModel.fromJson(model)));
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    userId = _myServices.sharedPreferences.getString('id')!;
    getUserFavorite(userId);
    super.onInit();
  }
}
