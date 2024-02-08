import 'package:get/get.dart';
import 'package:matgary/data/models/items_view_model.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsViewModel item;

  @override
  void onInit() {
    item = Get.arguments['selectedItem'] as ItemsViewModel;
    super.onInit();
  }
}
