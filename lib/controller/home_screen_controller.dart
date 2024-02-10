import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/home_date.dart';

abstract class HomeScreenController extends GetxController {
  getUserDate();
  getHomeDate();
  //? go to categories items
  goToCategoryItems(List categories, int cateIndex, String categoryId);
  //? user favorite Screen
  goToUserFavoriteScreen();
}

class HomeScreenControllerImp extends HomeScreenController {
  final MyServices _myServices = Get.find();

  //? selected device lang
  late String lang;
  //? for user data
  String? name;
  String? email;
  String? phone;
  //? home data
  List categories = [];
  List items = [];
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final HomeData _homeData = HomeData(crudImp: Get.find());

  @override
  getUserDate() {
    lang = _myServices.sharedPreferences.getString('langCode')!;
    name = _myServices.sharedPreferences.getString('name');
    email = _myServices.sharedPreferences.getString('email');
    phone = _myServices.sharedPreferences.getString('phone');
  }

  @override
  getHomeDate() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _homeData.getData();
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      }
    }
    update();
  }

  @override
  goToCategoryItems(List categories, int cateIndex, String categoryId) {
    Get.toNamed(AppRoutes.itemsScreen, arguments: {
      'categories': categories,
      'cateIndex': cateIndex,
      'categoryId': categoryId,
    });
  }

  @override
  goToUserFavoriteScreen() {
    Get.toNamed(AppRoutes.myFavoriteScreen);
  }

  @override
  void onInit() {
    getUserDate();
    getHomeDate();
    super.onInit();
  }
}
