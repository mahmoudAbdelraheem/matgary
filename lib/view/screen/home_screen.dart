import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/view/widget/home/categories_list_widget.dart';
import 'package:matgary/view/widget/home/discount_items_widget.dart';
import 'package:matgary/view/widget/home/head_line_text_widget.dart';
import 'package:matgary/view/widget/home_search_app_bar.dart';
import 'package:matgary/view/widget/home/offers_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return SafeArea(
      child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => HandlingDataView(
          statuseRequest: controller.statuseRequest,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              //? search and notification icons
              HomeSearchAppBar(
                hintText: 'Find Product ?',
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              //? card for offers , cashback & discount
              const OffersCardWidget(
                title: 'Summer Offers',
                body: 'Cashback 20%',
              ),
              //? categories head line text
              const HeadLineTextWidget(title: 'Categoties'),
              //? categories list
              const CategoriesListWidget(),
              //? Products with discount for you head line text
              const HeadLineTextWidget(title: 'Good Offers'),
              //? discount products (items) list
              DiscountItemsWidget(onTap: () {}),
              DiscountItemsWidget(onTap: () {}),
              DiscountItemsWidget(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
