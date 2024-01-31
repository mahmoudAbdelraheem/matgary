import 'package:flutter/material.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:lottie/lottie.dart';
import 'package:matgary/core/constant/app_image_assets.dart';

class HandlingDataView extends StatelessWidget {
  final StatuseRequest statuseRequest;
  final Widget child;
  const HandlingDataView(
      {super.key, required this.statuseRequest, required this.child});

  @override
  Widget build(BuildContext context) {
    return statuseRequest == StatuseRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAssets.loading,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          )
        : statuseRequest == StatuseRequest.offlineFailuer
            ? Center(
                child: Lottie.asset(
                  AppImageAssets.offline,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
            : statuseRequest == StatuseRequest.serverFailuer
                ? Center(
                    child: Lottie.asset(
                      AppImageAssets.serverFailuer,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  )
                : statuseRequest == StatuseRequest.failuer
                    ? Center(
                        child: Lottie.asset(
                          AppImageAssets.noData,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    : child;
  }
}
