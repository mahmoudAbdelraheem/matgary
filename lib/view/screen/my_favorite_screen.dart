import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/controller/favorite/my_favorite_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/home_search_app_bar.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<MyFavoriteControllerImp>(
          builder: (controller) => ListView(
            children: [
              //? search app bar
              HomeSearchAppBar(
                hintText: 'Find Product',
                onPressedNotifiation: () {},
                onPressedSearch: () {},
                onPressedFavorite: () {
                  controller.getUserFavorite(controller.userId);
                },
              ),
              const SizedBox(height: 10),
              //? user favorite items
              HandlingDataView(
                statuseRequest: controller.statuseRequest,
                child: ListView.builder(
                  itemCount: controller.myFavorite.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.myBlue.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        //? item image
                        Container(
                          height: 180,
                          width: 180,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.myGrey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiLink.itemsImg}/${controller.myFavorite[index].itemImage}',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        //? item name and price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    controller.myFavorite[index].itemName!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.myWhite,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '${controller.myFavorite[index].itemPrice!}\$',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.myWhite,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                            //? delete item icon
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  AppColors.myGrey.withOpacity(0.4),
                              child: IconButton(
                                onPressed: () {
                                  controller.deleteItemFromFavorite(
                                      controller.myFavorite[index].favoriteId!);
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  size: 35,
                                  color: AppColors.myWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
