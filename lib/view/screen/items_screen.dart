import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/favorite/favorite_controller.dart';
import 'package:matgary/controller/items_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/data/models/items_view_model.dart';
import 'package:matgary/view/widget/home_search_app_bar.dart';
import 'package:matgary/view/widget/items/categories_items_list.dart';
import 'package:matgary/view/widget/items/item_view_model_widget.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => Column(
              children: [
                //? search app bar
                HomeSearchAppBar(
                  hintText: 'Find Product',
                  onPressedSearch: () {},
                  onPressedFavorite: () {
                    controller.goToUserFavoriteScreen();
                  },
                ),
                //? categories data
                const CategoriesItemsListWidget(),
                //? items of category
                HandlingDataView(
                  statuseRequest: controller.statuseRequest,
                  child: Expanded(
                    child: SizedBox(
                      child: GridView.builder(
                        itemCount: controller.itemsView.length,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (_, index) {
                          //? add item id and item favorite value in isFavorite Map
                          favController.isFavorite[controller.itemsView[index]
                                  ['item_id']] =
                              controller.itemsView[index]['favorite_item'];
                          //? build item model
                          return ItemViewModelWidget(
                            itemsIndex: index,
                            //? go to product details screen
                            onTap: () {
                              controller.goToItemDetails(
                                ItemsViewModel.fromJson(
                                  controller.itemsView[index],
                                ),
                              );
                            },
                            //? build items view model
                            item: ItemsViewModel.fromJson(
                              controller.itemsView[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
