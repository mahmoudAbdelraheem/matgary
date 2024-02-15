import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/cart_data.dart';
import 'package:matgary/data/models/items_view_model.dart';

abstract class ItemDetailsController extends GetxController {
  initializData();

  ///? add item
  add();
  //? remove item
  remove();
  //? go to cart screen
  goToCart();
  //? add Item to Cart
  addItemToCart(String itemId);
  //? remove Item From Cart
  removeFromCart(String itemId);

  //? get cart item count
  getItemCount(String itemId);
}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsViewModel item;
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  int itemCount = 0;

  //? Cart data

  final CartData _cartData = CartData(crudImp: Get.find());
  final MyServices _myServices = Get.find();
  @override
  addItemToCart(itemId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _cartData.addToCart(
      userId: _myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        //? item added successfuly
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  removeFromCart(itemId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _cartData.removeFromCart(
      userId: _myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        //? item removed successfuly
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  initializData() async {
    statuseRequest = StatuseRequest.loading;
    item = Get.arguments['selectedItem'] as ItemsViewModel;
    itemCount = await getItemCount(item.itemId!);
    statuseRequest = StatuseRequest.success;
    update();
  }

  @override
  getItemCount(itemId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _cartData.getItemCount(
      userId: _myServices.sharedPreferences.getString('id')!,
      itemId: itemId,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        int itemCount = int.parse(response['data']);
        return itemCount;
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  add() {
    itemCount++;
    addItemToCart(item.itemId!);
    update();
  }

  @override
  remove() {
    if (itemCount > 0) {
      itemCount--;
      removeFromCart(item.itemId!);
      update();
    }
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cartScreen);
  }

  @override
  void onInit() {
    initializData();
    super.onInit();
  }
}
