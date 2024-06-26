import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forget_password/vrefiy_code_controller.dart';
import '../../../../core/class/handling_data_view.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/localizaion_keys.dart';
import '../../../widget/auth/custom_app_bar_widget.dart';

import '../../../widget/auth/custom_auth_logo_widget.dart';
import '../../../widget/auth/custom_body_text_widget.dart';

class VrefiyCodeScreen extends StatelessWidget {
  const VrefiyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VrefiyCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.vrefiyCodeTitle),
      body: GetBuilder<VrefiyCodeControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statuseRequest: controller.statuseRequest,
          myPressed: () {
            controller.tryAgain();
          },
          child: Form(
            //key: controller.formState,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              children: <Widget>[
                //? app logo image
                const SizedBox(height: 50),
                const CustomAuthLogoWidget(),
                const SizedBox(height: 50),
                //? body message
                const CustomBodyTextWidget(
                  body: LocalizationKeys.vrefiyCodeBody,
                ),
                //? otp text field
                OtpTextField(
                  borderRadius: BorderRadius.circular(15),
                  borderWidth: 3,
                  numberOfFields: 5,

                  focusedBorderColor: AppColors.myBlue,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.checkVerificationCode(verificationCode);
                    //controller.goToResetPassword();
                  }, // end onSubmit
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
