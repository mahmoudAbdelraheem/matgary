import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matgary/apis_link.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/categories_model.dart';

class CategoreyModelWidget extends StatelessWidget {
  final CategoriesModel model;
  const CategoreyModelWidget({
    super.key,
    required this.model,
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
            '${ApiLink.categoriesImg}/${model.image}',
            height: 80,
            width: 80,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              model.name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
