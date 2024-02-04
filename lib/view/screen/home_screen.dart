import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/app_image_assets.dart';
import 'package:matgary/data/models/categories_model.dart';
import 'package:matgary/view/widget/home/categorey_model_widget.dart';
import 'package:matgary/view/widget/home/head_line_text_widget.dart';
import 'package:matgary/view/widget/home/home_search_app_bar.dart';
import 'package:matgary/view/widget/home/offers_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: <Widget>[
                //? search and notification icons
                const HomeSearchAppBar(),
                //? card for offers , cashback & discount
                const OffersCardWidget(),
                //? categories head line text
                const HeadLineTextWidget(text: 'Categoties'),
                //? categories list
                _buildCategoriesList(controller),

                const SizedBox(height: 10),
                //? Products for you head line text
                const HeadLineTextWidget(text: 'Product For You'),

                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, i) => const SizedBox(width: 10),
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.myBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(AppImageAssets.logo),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildCategoriesList(HomeControllerImp controller) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoreyModelWidget(
              model: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            );
          }),
    );
  }
}
