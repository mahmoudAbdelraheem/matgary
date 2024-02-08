import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/item_details_controller.dart';
import 'package:matgary/core/functions/translate_database.dart';
import 'package:matgary/view/widget/item_details/custom_floating_action_btn.dart';
import 'package:matgary/view/widget/item_details/custom_item_quantity_widget.dart';
import 'package:matgary/view/widget/item_details/item_image_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());

    return GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) => Scaffold(
        //? add item to cart button
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionBtn(onTap: () {}),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            //? item image
            const ItemImageWidget(),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? item name
                  Text(
                    translateDatabase(
                        controller.item.itemName!, controller.item.itemNameAr!),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //? price and quantity
                  const CustomItemQuantityWidget(),
                  //? item description
                  Text(
                    translateDatabase(controller.item.itemDescription!,
                        controller.item.itemDescriptionAr!),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
