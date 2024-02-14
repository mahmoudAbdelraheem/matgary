import 'package:get/get.dart';
import 'package:matgary/controller/cart_controller.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/data/models/items_view_model.dart';

abstract class ItemDetailsController extends GetxController {
  initializData();

  ///? add item
  add();
  //? remove item
  remove();
  //? go to cart screen
  goToCart();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  //? to access add an remove func in cart controller
  CartControllerImp cartController = Get.put(CartControllerImp());

  late ItemsViewModel item;
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  int itemCount = 0;

  @override
  initializData() async {
    statuseRequest = StatuseRequest.loading;
    item = Get.arguments['selectedItem'] as ItemsViewModel;
    itemCount = await cartController.getItemCount(item.itemId!);
    statuseRequest = StatuseRequest.success;
    update();
  }

  @override
  add() {
    itemCount++;
    cartController.addItemToCart(item.itemId!);
    update();
  }

  @override
  remove() {
    if (itemCount > 0) {
      itemCount--;
      cartController.removeFromCart(item.itemId!);
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
