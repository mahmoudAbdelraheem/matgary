import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/orders/archive_controller.dart';
import 'package:matgary/core/constant/app_image_assets.dart';
import 'package:rating_dialog/rating_dialog.dart';

late String orderId;
final _dialog = RatingDialog(
  initialRating: 1.0,

  // your app's name?
  title: const Text(
    'Matgary',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  // encourage your user to leave a high rating?
  message: const Text(
    'Tap a star to set your rating. Add more description here if you want.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15),
  ),
  // your app's logo?
  image: Image.asset(
    AppImageAssets.logo,
    height: 100,
    width: 100,
  ),
  submitButtonText: 'Submit',
  commentHint: 'Set your custom comment hint',
  onCancelled: () {},
  onSubmitted: (response) {
    //print('rating: ${response.rating}, comment: ${response.comment}');
    ArchiveControllerImp controller = Get.find();
    controller.submitOrderRating(orderId, response.rating, response.comment);
  },
);

void showRatingDialog(BuildContext context, id) {
  orderId = id;
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => _dialog,
  );
}
