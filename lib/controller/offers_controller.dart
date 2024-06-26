import 'package:get/get.dart';
import '../core/class/statuse_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/offers_data.dart';
import '../data/models/items_view_model.dart';

import '../core/constant/routes.dart';

abstract class OffersController extends GetxController {
  //? get all offers
  getOffers();
  //? goto item details screen
  goToItemDetails(ItemsViewModel selectedItem);
}

class OffersControllerImp extends OffersController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final OffersData _offersData = OffersData(crudImp: Get.find());
  final List<ItemsViewModel> offers = [];
  @override
  getOffers() async {
    offers.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _offersData.getData();
    statuseRequest = handlingData(response);

    if (StatuseRequest.success == statuseRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        offers.addAll(responseData.map((e) => ItemsViewModel.fromJson(e)));
      } else {
        //? there is no offers today
        Get.snackbar('OOPS!', 'There Is No Offers Today!');
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
  void onInit() async {
    await getOffers();
    super.onInit();
  }
}
