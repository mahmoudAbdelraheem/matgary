import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/favorite/favorite_controller.dart';
import 'package:matgary/controller/offers_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import '../widget/custom_offers_card_widget.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Offers')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<OffersControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.offers.length,
              itemBuilder: (_, index) {
                //? set is favorite map
                favController.setFavorite(
                  controller.offers[index].itemId!,
                  controller.offers[index].itemFavorite!,
                );
                return CustomOffersCardWidget(
                  model: controller.offers[index],
                  onDetails: () {
                    //? go to items details screen
                    controller.goToItemDetails(
                      controller.offers[index],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
