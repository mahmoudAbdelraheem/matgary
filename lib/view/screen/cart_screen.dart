import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/app_colors.dart';
import '../widget/cart/cart_floation_action_btn.dart';
import '../widget/cart/cart_item_count_text.dart';
import '../widget/cart/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CartFloatingActionBtnWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.myBlue,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.myWhite,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                //? user items count
                CartItemCountTextWidget(
                  cartItemsCount: controller.orderTotalCount,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.cart.length,
                  itemBuilder: (_, index) => CartItemWidget(
                    model: controller.cart[index],
                    onAdd: () async {
                      await controller
                          .addItemToCart(controller.cart[index].itemId!);
                      controller.refreshCart();
                    },
                    onRemove: () async {
                      await controller
                          .removeFromCart(controller.cart[index].itemId!);
                      controller.refreshCart();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
