import 'package:get/get.dart';
import 'search_controller.dart';
import '../core/class/statuse_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/home_date.dart';
import '../data/models/items_view_model.dart';
import '../data/models/top_selling_model.dart';

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
  List cardOffers = [];
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
    cardOffers.clear();
    items.clear();
    topSelling.clear();
    categories.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _homeData.getData();
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        if (response['categories']['status'] == 'success') {
          categories.addAll(response['categories']['data']);
        }
        if (response['items']['status'] == 'success') {
          items.addAll(response['items']['data']);
        }
        if (response['cardoffer']['status'] == 'success') {
          cardOffers.addAll(response['cardoffer']['data']);
        }
        if (response['topselling']['status'] == 'success') {
          List topSellingData = response['topselling']['data'];
          topSelling
              .addAll(topSellingData.map((e) => TopSellingModel.fromJson(e)));
        }
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
