import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/cart_data.dart';
import 'package:matgary/data/models/cart_view_model.dart';

abstract class CartController extends GetxController {
  //? change container heigth
  changeContainerHeigth();
  //? add Item to Cart
  addItemToCart(String itemId);
  //? remove Item From Cart
  removeFromCart(String itemId);

  ///? get all cart items
  getCartItem();
  //? get cart item count
  getItemCount(String itemId);
}

class CartControllerImp extends CartController {
  //? open and close total price widget
  bool isOpen = false;
  //? Cart data
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final CartData _cartData = CartData(crudImp: Get.find());
  final MyServices _myServices = Get.find();

  //? user Cart items
  List<CartViewModel> cart = [];
  CartTotalModel cartTotal = CartTotalModel(totalCount: '0', totalPrice: '0');

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
  getCartItem() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _cartData.viewCartItems(
      userId: _myServices.sharedPreferences.getString('id')!,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        cart.addAll(
            responseData.map((cartItem) => CartViewModel.fromJson(cartItem)));
        cartTotal = CartTotalModel.fromJson(response["totlaPriceCount"]);
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }
}
