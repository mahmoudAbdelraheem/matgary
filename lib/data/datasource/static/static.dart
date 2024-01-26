import 'package:matgary/core/constant/app_image_assets.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/data/models/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: LocalizationKeys.onBoardingTitleOne,
    body: LocalizationKeys.onBoardingBodyOne,
    image: AppImageAssets.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: LocalizationKeys.onBoardingTitleTwo,
    body: LocalizationKeys.onBoardingBodyTwo,
    image: AppImageAssets.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: LocalizationKeys.onBoardingTitleThree,
    body: LocalizationKeys.onBoardingBodythree,
    image: AppImageAssets.onBoardingImageThree,
  ),
  OnBoardingModel(
    title: LocalizationKeys.onBoardingTitleFour,
    body: LocalizationKeys.onBoardingBodyFour,
    image: AppImageAssets.onBoardingImageFour,
  ),
  // OnBoardingModel(
  //   title: 'Choose Product',
  //   body:
  //       'We Have a 100K+ Products. Choose\nYour Product From Our\nMatgary Shop',
  //   image: AppImageAssets.onBoardingImageOne,
  // ),
  // OnBoardingModel(
  //   title: 'Easy & Save Payment',
  //   body:
  //       'Easy Checkout And Save Payment\nmethod. Trusted By Our Customers\nfrom all over the world.',
  //   image: AppImageAssets.onBoardingImageTwo,
  // ),
  // OnBoardingModel(
  //   title: 'Track Your Order',
  //   body:
  //       "Best Tracker has been Used for\nTrack your order. You'll Know where\nYour Product is at the moment.",
  //   image: AppImageAssets.onBoardingImageThree,
  // ),
  // OnBoardingModel(
  //   title: 'Fast Delivery',
  //   body:
  //       'Reliable And Fast Delivery. We\nDeliver Your product the fastest\nway possible.',
  //   image: AppImageAssets.onBoardingImageFour,
  // ),
];
