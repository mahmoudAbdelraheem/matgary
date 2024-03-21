import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/data/datasource/remote/offers_data.dart';
import 'package:matgary/data/models/items_view_model.dart';

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
