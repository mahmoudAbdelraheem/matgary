import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/routes.dart';

abstract class OrderController extends GetxController {
  goToPendingOrders();
  goToArchiveOrders();
  goToCancledOrders();
}

class OrderControllerImp extends OrderController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  //? demo data for buttons
  final List btnData = [
    {
      'title': "Pending Orders",
      'icon': Icons.assessment_outlined,
      'color': AppColors.myBlue,
    },
    {
      'title': "Archive Orders",
      'icon': Icons.checklist_rtl_sharp,
      'color': AppColors.myGrey,
    },
    {
      'title': "Canceld Orders",
      'icon': Icons.cancel_presentation_rounded,
      'color': AppColors.myRed,
    },
  ];

  @override
  goToPendingOrders() {
    Get.toNamed(AppRoutes.pendingScreen);
  }

  @override
  goToArchiveOrders() {
    Get.toNamed(AppRoutes.archiveScreen);
  }

  @override
  goToCancledOrders() {
    Get.toNamed(AppRoutes.cancledScreen);
  }
}
