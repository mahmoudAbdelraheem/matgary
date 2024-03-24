import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_screen_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/view/widget/home/categories_list_widget.dart';
import 'package:matgary/view/widget/home/discount_items_widget.dart';
import 'package:matgary/view/widget/home/head_line_text_widget.dart';
import 'package:matgary/view/widget/custom_search_app_bar.dart';
import 'package:matgary/view/widget/home/offers_card_widget.dart';
import 'package:matgary/view/widget/home/top_selling_card_widget.dart';
import 'package:matgary/view/widget/item_search_result_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return SafeArea(
      child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getHomeDate();
            },
            child: ListView(
              children: <Widget>[
                //? search and favorites icons
                CustomSearchAppBar(
                  hintText: 'Find Product ?',
                  myController: controller.searchController,
                  onPressedSearch: () {
                    controller.startSearch();
                  },
                  onFromChange: (val) {
                    controller.endSearch(val);
                  },
                  onPressedNotify: () {
                    controller.goToUserNotificationScreen();
                  },
                ),
                controller.isSearch
                    ? ItemsSearchResultWidget(
                        result: controller.searchIemsResult)
                    : HandlingDataView(
                        statuseRequest: controller.statuseRequest,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //? card for offers , cashback & discount
                            if (controller.cardOffers.isNotEmpty)
                              OffersCardWidget(
                                title:
                                    '${controller.cardOffers[0]['home_card_title']}',
                                body:
                                    '${controller.cardOffers[0]['home_card_body']}',
                              ),
                            //? categories head line text
                            const HeadLineTextWidget(title: 'Categoties'),
                            //? categories list
                            const CategoriesListWidget(),
                            //? Products with discount for you head line text
                            const HeadLineTextWidget(title: 'Good Offers'),
                            //? discount products (items) list
                            DiscountItemsWidget(onTap: () {
                              controller.goToOffersScreen();
                            }),
                            // todo complete top selling ui and logic
                            //? top selling porducts
                            const HeadLineTextWidget(title: 'Top Selling'),
                            ...List.generate(controller.topSelling.length,
                                (index) {
                              return TopSellingCardWidget(
                                model: controller.topSelling[index],
                              );
                            }),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
