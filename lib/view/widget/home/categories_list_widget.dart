import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/categories_model.dart';

class CategoriesListWidget extends GetView<HomeScreenControllerImp> {
  final void Function()? onTap;
  const CategoriesListWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, index) => const SizedBox(width: 20),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Categories(
                categorey: CategoriesModel.fromJson(
                  controller.categories[index],
                ),
              );
            }),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categorey;
  const Categories({
    super.key,
    required this.categorey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          SvgPicture.network(
            '${ApiLink.categoriesImg}/${categorey.image}',
            height: 80,
            width: 80,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              categorey.name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
