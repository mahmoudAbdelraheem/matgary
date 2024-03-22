import 'package:get/get.dart';
import 'package:matgary/controller/search_controller.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/home_date.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:matgary/data/models/top_selling_model.dart';

abstract class HomeScreenController extends SearchControllerImp {
  getUserDate();
  getHomeDate();
  //? go to categories items
  goToCategoryItems(List categories, int cateIndex, String categoryId);
  //? user notifications Screen
  goToUserNotificationScreen();

  goToItemDetails(ItemsViewModel selectedItem);
  //? go to offers page
  goToOffersScreen();
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
  List<TopSellingModel> topSelling = [];
  //StatuseRequest statuseRequest = StatuseRequest.defualt;
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
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        List topSellingData = response['topselling']['data'];
        topSelling
            .addAll(topSellingData.map((e) => TopSellingModel.fromJson(e)));
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
  goToUserNotificationScreen() {
    Get.toNamed(AppRoutes.notificationScreen);
  }

  @override
  goToItemDetails(ItemsViewModel selectedItem) {
    Get.toNamed(AppRoutes.itemDetailsScreen, arguments: {
      'selectedItem': selectedItem,
    });
  }

  @override
  goToOffersScreen() {
    Get.toNamed(AppRoutes.offersScreen);
  }

  @override
  void onInit() {
    getUserDate();
    getHomeDate();
    super.onInit();
  }
}
