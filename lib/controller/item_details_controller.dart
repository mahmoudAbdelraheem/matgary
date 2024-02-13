import 'package:get/get.dart';
import 'package:matgary/controller/cart_controller.dart';
import 'package:matgary/data/models/items_view_model.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  //? to access add an remove func in cart controller
  CartControllerImp cartController = Get.put(CartControllerImp());

  late ItemsViewModel item;

  @override
  void onInit() {
    item = Get.arguments['selectedItem'] as ItemsViewModel;
    super.onInit();
  }
}
