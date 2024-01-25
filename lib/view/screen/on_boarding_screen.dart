import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/datasource/static/static.dart';
import 'package:matgary/data/models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: onBoardingList.length,
                itemBuilder: (_, index) =>
                    _buildOnBoardingModel(model: onBoardingList[index]),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text('const text'),
            ),
          ],
        ),
      ),
    );
  }

  _buildOnBoardingModel({required OnBoardingModel model}) {
    return Column(
      children: [
        const SizedBox(height: 30),
        _buildTitle(model.title),
        const SizedBox(height: 40),
        _buildImage(model.image),
        const SizedBox(height: 40),
        _buildBody(model.body),
      ],
    );
  }

  Container _buildBody(String body) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        body,
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w400,
          color: AppColors.myGrey,
        ),
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

  Text _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
