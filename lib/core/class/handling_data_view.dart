import 'package:flutter/material.dart';
import 'statuse_request.dart';
import 'package:lottie/lottie.dart';
import '../constant/app_colors.dart';
import '../constant/app_image_assets.dart';

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
              AppImageAssets.loadingCart,
              width: 300,
              height: 300,
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

class HandlingDataRequest extends StatelessWidget {
  final StatuseRequest statuseRequest;
  final void Function() myPressed;
  final Widget child;

  const HandlingDataRequest({
    super.key,
    required this.statuseRequest,
    required this.myPressed,
    required this.child,
  });

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
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      AppImageAssets.offline,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  MaterialButton(
                    onPressed: myPressed,
                    color: AppColors.myBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Try Again.',
                      style: TextStyle(
                        color: AppColors.myWhite,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            : statuseRequest == StatuseRequest.serverFailuer
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(
                          AppImageAssets.serverFailuer,
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      MaterialButton(
                        onPressed: myPressed,
                        color: AppColors.myBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Try Again.',
                          style: TextStyle(
                            color: AppColors.myWhite,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                : child;
  }
}
