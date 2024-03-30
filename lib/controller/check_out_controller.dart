import 'package:get/get.dart';
import '../core/class/statuse_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/order_data.dart';
import '../data/models/address_model.dart';

abstract class CheckOutController extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseAddressId(String val);
  //? get all user address
  getUserAddress();
  //?
  intialzeData();
  //? add order to database
  orderCheckOut();
  //? if user dont have an address
  goToAddAddress();
}

class CheckOutControllerImp extends CheckOutController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  String? paymentMethod;
  String? deliveryType;
  String? addressId;
  String couponDiscount = '0';

  List<AddressModel> userAddress = [];
  final AddressData _addressData = AddressData(crudImp: Get.find());
  final OrderData _orderData = OrderData(crudImp: Get.find());
  final MyServices _myServices = Get.find();
  //? data come from cart page
  late String couponId;
  late String orderPrice;

  @override
  chooseAddressId(String val) {
    addressId = val;
    print("address = $addressId");
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    print("deliveryType = $deliveryType ");
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
        addressId = userAddress[0].addressId!;
      } else {
        // statuseRequest = StatuseRequest.failuer;
        // todo snak bar to try again
        //? make user to add address
      }
    }
    update();
  }

  @override
  orderCheckOut() async {
    //?
    if (paymentMethod == null || deliveryType == null || userAddress.isEmpty) {
      return Get.snackbar('warning',
          'You Need To Select Payment Method And Delivery Type First');
    } else {
      statuseRequest = StatuseRequest.loading;
      update();
      var response = await _orderData.addOrderDate(
        userId: _myServices.sharedPreferences.getString('id')!,
        userAddress: addressId!,
        orderType: deliveryType!,
        paymentMethod: paymentMethod!,
        shippingPrice: '10', //todo add siphhing price
        orderPrice: orderPrice,
        couponId: couponId,
        couponDiscount: couponDiscount,
      );
      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          statuseRequest = StatuseRequest.loading;
          Get.snackbar('Success', 'Order Add Succefully');
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          // statuseRequest = StatuseRequest.failuer;
          Get.snackbar('Faild', 'Please Try Again');
          // todo add order data failuer
          //? make user to add address
        }
      }
      update();
    }
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoutes.addAddressScreen);
  }

  @override
  intialzeData() {
    getUserAddress();
    couponId = Get.arguments['couponid'];
    couponDiscount = Get.arguments['coupondiscount'].toString();
    orderPrice = Get.arguments['orderprice'];
  }

  @override
  void onInit() {
    intialzeData();
    super.onInit();
  }
}
