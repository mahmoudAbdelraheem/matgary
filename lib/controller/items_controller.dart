import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/items_view_data.dart';
import 'package:matgary/data/models/items_view_model.dart';

abstract class ItemsController extends GetxController {
  //? to initialize selected & list of Categories comming from home page
  initialData();
  //? get items data from API
  getItemsData(String categoryId, String userId);
  //? to change categorise of items screen
  changeCategoryIndex(int index, String categoryId);
  //? add items for cart
  addItemToCart();
  //? go to product details screen
  goToItemDetails(ItemsViewModel selectedItem);
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
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  List itemsView = [];
  final ItemsViewData _itemsViewData = ItemsViewData(crudImp: Get.find());

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
        itemsView.addAll(response['data']);
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  addItemToCart() {
    // TODO: implement addItemToCart
    throw UnimplementedError();
  }

  @override
  goToItemDetails(ItemsViewModel selectedItem) {
    Get.toNamed(AppRoutes.itemDetailsScreen, arguments: {
      'selectedItem': selectedItem,
    });
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
