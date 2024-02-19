import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/core/functions/form_valid_input.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/core/shared/custom_app_botton.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/core/shared/custom_app_text_form.dart';

import '../../../../controller/auth/forget_password/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.forgetPassword),
      //?
      body: GetBuilder<ForgetPassworControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statuseRequest: controller.statuseRequest,
          myPressed: () {
            controller.tryAgain();
          },
          child: Form(
            key: controller.forgetPassFormState,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              children: <Widget>[
                //? app logo image
                const SizedBox(height: 50),
                const CustomAuthLogoWidget(),
                const SizedBox(height: 50),
                //? body message
                const CustomBodyTextWidget(
                  body: LocalizationKeys.forgetPasswordBody,
                ),
                //? email text form
                CustomAppTextFom(
                  myValidator: (val) {
                    return formVaildInput(
                        value: val!, type: 'email', min: 6, max: 50);
                  },
                  myKeyboardType: TextInputType.emailAddress,
                  labelText: LocalizationKeys.emailLable,
                  hintText: LocalizationKeys.emailHint,
                  sufixIcon: Icons.email_outlined,
                  myController: controller.email,
                ),

                //? check button and go to vrefiy code screen
                CustomAppBotton(
                  btnText: LocalizationKeys.check,
                  btnColor: AppColors.myBlue,
                  textColor: AppColors.myWhite,
                  myPressed: () {
                    controller.checkEmail();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
