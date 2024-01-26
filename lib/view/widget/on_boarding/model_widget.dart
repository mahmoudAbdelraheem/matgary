import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/on_boarding_controller.dart';
import 'package:matgary/data/models/on_boarding_model.dart';

import '../../../data/datasource/static/static.dart';

class OnBoardingModelWidget extends GetView<OnBoardingControllerImp> {
  const OnBoardingModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (pageIndex) {
        controller.onPageChanged(pageIndex);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) =>
          _buildModelWidget(model: onBoardingList[index], context: context),
    );
  }

  _buildModelWidget(
      {required OnBoardingModel model, required BuildContext context}) {
    return Column(
      children: [
        const SizedBox(height: 30),
        _buildTitle(model.title, context),
        const SizedBox(height: 40),
        _buildImage(model.image),
        const SizedBox(height: 40),
        _buildBody(model.body, context),
      ],
    );
  }

  Container _buildBody(String body, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        body.tr,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container _buildImage(String imageUrl) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(imageUrl).image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Text _buildTitle(String title, BuildContext context) {
    return Text(
      title.tr,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
