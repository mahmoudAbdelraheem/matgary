import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/auth/vrefiy_email_code_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/core/shared/custom_app_botton.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';

class VrefiyEmailCodeScreen extends StatelessWidget {
  const VrefiyEmailCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VrefiyEmailCodeControllerImp controller =
        Get.put(VrefiyEmailCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.vrefiyCodeTitle),
      body: Form(
        //key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          children: <Widget>[
            //? app logo image
            const SizedBox(height: 50),
            const CustomAuthLogoWidget(),
            const SizedBox(height: 50),
            //? body message
            CustomBodyTextWidget(
              body: LocalizationKeys.vrefiyCodeBody,
              email: " ${controller.email!}",
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
                controller.checkEmailVerificationCode(verificationCode);
                //controller.goToSuccessSignUp();
              }, // end onSubmit
            ),
            const SizedBox(height: 50),
            //? resend virefiy code button
            CustomAppBotton(
              btnText: 'Resend Vireification Code',
              btnColor: AppColors.myBlue,
              textColor: AppColors.myWhite,
              myPressed: () {
                controller.resendVirefiyCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
