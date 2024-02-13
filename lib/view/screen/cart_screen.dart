import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/cart_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/cart/cart_floation_action_btn.dart';
import 'package:matgary/view/widget/cart/cart_item_count_text.dart';
import 'package:matgary/view/widget/cart/cart_item_widget.dart';

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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const CartItemCountTextWidget(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) => const CartItemWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
