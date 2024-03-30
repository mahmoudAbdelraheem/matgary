import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/models/categories_model.dart';

class CategoriesItemsListWidget extends GetView<ItemsControllerImp> {
  const CategoriesItemsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 10, top: 5),
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
        controller.changeCategoryIndex(selectedIndex, categorey.id);
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Chip(
          backgroundColor: selectedIndex == controller.selectedCate
              ? AppColors.myBlue.withOpacity(0.5)
              : AppColors.myGrey.withOpacity(0.3),
          label: Text(
            translateDatabase(categorey.name, categorey.nameAr),
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
