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
  getItemsData(String categoryId);
  //? to change categorise of items screen
  changeCategoryIndex(int index, String categoryId);
  //? add items for cart
  addItemToCart();
  //? add & remove items to the favorite list
  addAbdRemoveItemToFavorite(int favIndex);
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

  //?test favorite
  List<int> favoriteItems = [];

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
    getItemsData(categoryId);
  }

  @override
  changeCategoryIndex(int index, String categoryId) {
    selectedCate = index;

    getItemsData(categoryId);

    update();
  }

  @override
  getItemsData(categoryId) async {
    //? befor add items to the list items view we remove all old items category
    //? to add just selected category items
    itemsView.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response =
        await _itemsViewData.getItemsViewDate(categoryId: categoryId);
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
  addAbdRemoveItemToFavorite(int favIndex) {
    //? if the items is not favorite well be adde to the favorite list
    if (!favoriteItems.contains(favIndex)) {
      favoriteItems.add(favIndex);
    } else {
      //? if the favorite list contain favindex the items will be removed from favList
      favoriteItems.removeWhere((i) => i == favIndex);
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
