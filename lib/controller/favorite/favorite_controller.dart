import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/favorite/favorite_item_date.dart';

abstract class FavoriteController extends GetxController {
  //? set items in isfavorite map
  setFavorite(String itemId, String val);
  //? add to favorite table
  addToFavorite(String userId, String itemId);
  //? remove from favorite table
  removeFromFavorite(String userId, String itemId);
  //? get favorite items based on user id
  getUserFavoriteItems(String userId);
}

class FavoriteControllerImp extends FavoriteController {
  //? contain all items id with its favorite value (1 => 0)
  Map isFavorite = {};
  FavoriteItemData favoriteItem = FavoriteItemData(crudImp: Get.find());
  StatuseRequest statuseRequest = StatuseRequest.defualt;

  //? for user id
  final MyServices _myServices = Get.find();
  late String userId;

  //? favorite user item
  List myFavorite = [];

  @override
  void onInit() {
    userId = _myServices.sharedPreferences.getString('id')!;
    super.onInit();
  }

  @override
  setFavorite(itemId, val) {
    isFavorite[itemId] = val;
    update();
  }

  @override
  addToFavorite(String userId, String itemId) async {
    statuseRequest = StatuseRequest.loading;
    var response = await favoriteItem.addItemToFavorite(
      userId: userId,
      itemId: itemId,
    );

    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        //todo return snack bar items is added successful
        statuseRequest = StatuseRequest.success;
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
  }

  @override
  removeFromFavorite(String userId, String itemId) async {
    statuseRequest = StatuseRequest.loading;
    var response = await favoriteItem.removeItemFromFavorite(
      userId: userId,
      itemId: itemId,
    );

    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        //todo return snack bar items is remove successfuly
        statuseRequest = StatuseRequest.success;
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
  }

  @override
  getUserFavoriteItems(String userId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await favoriteItem.viewFavorite(
      userId: userId,
    );

    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        myFavorite.addAll(response['data']);
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }
}
