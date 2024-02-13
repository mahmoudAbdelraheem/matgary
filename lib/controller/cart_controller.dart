import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/cart_data.dart';

abstract class CartController extends GetxController {
  //? change container heigth
  changeContainerHeigth();
  //? add Item to Cart
  addItemToCart(String itemId);
  //? remove Item From Cart
  removeFromCart(String itemId);

  ///? get all cart items
  getCartItem();
}

class CartControllerImp extends CartController {
  //? open and close total price widget
  bool isOpen = false;
  //? Cart data
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final CartData _cartData = CartData(crudImp: Get.find());
  final MyServices _myServices = Get.find();
  @override
  changeContainerHeigth() {
    isOpen = !isOpen;
    update();
  }

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
  getCartItem() {
    // TODO: implement getCartItem
    throw UnimplementedError();
  }
}
