import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCategoryIndex(int index);
}

class ItemsControllerImp extends ItemsController {
  late int selectedCate;
  late List categories;

  @override
  initialData() {
    selectedCate = Get.arguments['cateIndex'];
    categories = Get.arguments['categories'] as List;
  }

  @override
  changeCategoryIndex(int index) {
    selectedCate = index;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
