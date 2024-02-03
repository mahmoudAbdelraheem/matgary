import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_controller.dart';
import 'package:matgary/view/widget/home/home_search_app_bar.dart';
import 'package:matgary/view/widget/home/offers_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const <Widget>[
            HomeSearchAppBar(),
            OffersCardWidget(),
          ],
        ),
      ),
    );
  }
}
