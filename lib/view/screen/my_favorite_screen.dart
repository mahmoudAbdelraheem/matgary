import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/favorite/my_favorite_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/shared/custom_app_appbar.dart';
import 'package:matgary/view/widget/my_favorite_item_widget.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return GetBuilder<MyFavoriteControllerImp>(
      builder: (controller) => HandlingDataView(
        statuseRequest: controller.statuseRequest,
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getUserFavorite(controller.userId);
          },
          child: ListView(
            children: [
              const CustomAppAppBar(title: 'Favorite Items'),

              //? user favorite items
              Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: controller.myFavorite.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return MyFavoriteItemWidget(
                      item: controller.myFavorite[index],
                      onDelete: () {
                        controller.deleteItemFromFavorite(
                            controller.myFavorite[index].favoriteId!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
