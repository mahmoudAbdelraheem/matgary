import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/address_data.dart';
import 'package:matgary/data/models/address_model.dart';

abstract class CheckOutController extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseAddressId(String val);
  //? get all user address
  getUserAddress();
}

class CheckOutControllerImp extends CheckOutController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  String? paymentMethod;
  String? deliveryType;
  String? addressId;
  List<AddressModel> userAddress = [];
  final AddressData _addressData = AddressData(crudImp: Get.find());
  final MyServices _myServices = Get.find();

  @override
  chooseAddressId(String val) {
    addressId = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

//? will be called when user select delivery method
  @override
  getUserAddress() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _addressData.viewData(
      userId: _myServices.sharedPreferences.getString('id')!,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        userAddress.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      } else {
        // statuseRequest = StatuseRequest.failuer;
        // todo snak bar to try again
        //? make user to add address
      }
    }
    update();
  }

  @override
  void onInit() {
    getUserAddress();
    super.onInit();
  }
}
