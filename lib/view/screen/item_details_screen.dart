import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/item_details_controller.dart';
import 'package:matgary/view/widget/item%20details/item_image_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ItemDetailsControllerImp>(
          builder: (controller) => const Column(
            children: [
              //? item image
              ItemImageWidget(),
              //? for item title & details
              //! to be continue item title and discrbtion
              // ListView(
              //   padding: const EdgeInsets.all(20),
              //   children: [
              //     Text(
              //       translateDatabase(
              //           controller.item.itemName!, controller.item.itemNameAr!),
              //       style: const TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
