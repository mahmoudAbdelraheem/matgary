import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/favorite/my_favorite_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/view/widget/my_favorite_item_widget.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Items',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<MyFavoriteControllerImp>(
          builder: (controller) => ListView(
            children: [
              const SizedBox(height: 10),
              //? user favorite items
              HandlingDataView(
                statuseRequest: controller.statuseRequest,
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
