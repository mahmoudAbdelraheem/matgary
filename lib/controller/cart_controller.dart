import 'package:flutter/widgets.dart';
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

  //? reset cart variables
  resetCartVar();
  //? refresh cart data after add or remover
  refreshCart();

  //? get all cart items
  getCartItem();
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
  double orderTotalPrice = 0.0;
  int orderTotalCount = 0;
  //? for coupone
  late TextEditingController couponController;

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
  getCartItem() async {
    statuseRequest = StatuseRequest.loading;
    update();

    var response = await _cartData.viewCartItems(
      userId: _myServices.sharedPreferences.getString('id')!,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        if (response['data']['status'] == 'success') {
          List responseData = response['data']['data'];
          cart.clear();
          cart.addAll(
              responseData.map((cartItem) => CartViewModel.fromJson(cartItem)));
          Map totalPriceCountData = response['totlaPriceCount'];
          orderTotalPrice = double.parse(totalPriceCountData['total_price']);
          orderTotalCount = int.parse(totalPriceCountData['total_count']);
        }
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  resetCartVar() {
    orderTotalCount = 0;
    orderTotalPrice = 0.0;
    cart.clear();
  }

  @override
  refreshCart() {
    resetCartVar();
    getCartItem();
  }

  @override
  void onInit() {
    getCartItem();
    couponController = TextEditingController();
    super.onInit();
  }
}
