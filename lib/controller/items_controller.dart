import 'package:get/get.dart';
import 'search_controller.dart';
import '../core/class/statuse_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/datasource/remote/items_view_data.dart';
import '../data/models/items_view_model.dart';

abstract class ItemsController extends SearchControllerImp {
  //? to initialize selected & list of Categories comming from home page
  initialData();
  //? get items data from API
  getItemsData(String categoryId, String userId);
  //? to change categorise of items screen
  changeCategoryIndex(int index, String categoryId);
  //? add items for cart
  addItemToCart(String itemId);
  //? go to product details screen
  goToItemDetails(ItemsViewModel selectedItem);
  //? go to user notifications screen
  goToUserNotificationScreen();
}

class ItemsControllerImp extends ItemsController {
  //? for selected device language
  late String lang;
  MyServices myServices = Get.find();
  //? data come from home page
  late int selectedCate;
  late List categories;

  //? get user id
  late String userId;

  //? for get items from api
  // StatuseRequest statuseRequest = StatuseRequest.defualt;
  List<ItemsViewModel> itemsView = [];
  final ItemsViewData _itemsViewData = ItemsViewData(crudImp: Get.find());
  final CartData _cartData = CartData(crudImp: Get.find());

  //? category id
  late String categoryId;

  @override
  initialData() {
    selectedCate = Get.arguments['cateIndex'];
    categories = Get.arguments['categories'] as List;
    categoryId = Get.arguments['categoryId'];
    lang = myServices.sharedPreferences.getString('langCode')!;
    userId = myServices.sharedPreferences.getString('id')!;
    getItemsData(categoryId, userId);
  }

  @override
  changeCategoryIndex(int index, String categoryId) {
    selectedCate = index;

    getItemsData(categoryId, userId);

    update();
  }

  @override
  getItemsData(categoryId, userId) async {
    //? befor add items to the list items view we remove all old items category
    //? to add just selected category items
    itemsView.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _itemsViewData.getItemsViewDate(
        categoryId: categoryId, userId: userId);
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        itemsView.addAll(responseData.map((e) => ItemsViewModel.fromJson(e)));
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  addItemToCart(String itemId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _cartData.addToCart(
      userId: myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar('Success', 'Item Added Successfully');
      } else {
        Get.snackbar('Failuer', 'Please Try Again');
      }
    }
    update();
  }

  @override
  goToItemDetails(ItemsViewModel selectedItem) {
    Get.toNamed(AppRoutes.itemDetailsScreen, arguments: {
      'selectedItem': selectedItem,
    });
  }

  @override
  goToUserNotificationScreen() {
    Get.toNamed(AppRoutes.notificationScreen);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
