import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/functions/translate_database.dart';
import 'package:matgary/data/models/categories_model.dart';

class CategoriesListWidget extends GetView<HomeScreenControllerImp> {
  const CategoriesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              cateIndex: index,
              categorey: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            );
          }),
    );
  }
}

class Categories extends GetView<HomeScreenControllerImp> {
  final CategoriesModel categorey;
  final int cateIndex;
  const Categories({
    super.key,
    required this.categorey,
    required this.cateIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToCategoryItems(
            controller.categories, cateIndex, categorey.id);
      },
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.myBlue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.network(
                '${ApiLink.categoriesImg}/${categorey.image}',
                height: 80,
                width: 80,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Text(
                translateDatabase(categorey.name, categorey.nameAr),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
