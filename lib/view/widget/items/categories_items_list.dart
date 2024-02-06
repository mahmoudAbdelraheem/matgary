import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/items_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/categories_model.dart';

class CategoriesItemsListWidget extends GetView<ItemsControllerImp> {
  const CategoriesItemsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(bottom: 10, top: 15),
      alignment: Alignment.center,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              selectedIndex: index,
              categorey: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categorey;
  final int selectedIndex;
  const Categories({
    super.key,
    required this.selectedIndex,
    required this.categorey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategoryIndex(selectedIndex);
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Chip(
          backgroundColor: selectedIndex == controller.selectedCate
              ? AppColors.myBlue.withOpacity(0.5)
              : AppColors.myGrey.withOpacity(0.3),
          label: Text(
            categorey.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selectedIndex == controller.selectedCate
                  ? AppColors.myBlack
                  : AppColors.myGrey,
            ),
          ),
        ),
      ),
    );
  }
}
