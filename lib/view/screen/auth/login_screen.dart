import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/auth/login_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/core/functions/exit_app_alert.dart';
import 'package:matgary/core/functions/form_valid_input.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_title_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/have_or_not_account_text.dart';
import '../../../core/shared/custom_app_botton.dart';
import '../../../core/shared/custom_app_text_form.dart';
import '../../widget/auth/forget_password_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.signIn),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          } else {
            exitAppAlert();
          }
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statuseRequest: controller.statuseRequest,
            myPressed: () {
              controller.tryAgain();
            },
            child: Form(
              key: controller.loginFormState,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                children: <Widget>[
                  //? app logo image
                  const CustomAuthLogoWidget(),
                  //? welcom back
                  const CustomTitleTextWidget(title: LocalizationKeys.welcom),
                  //? body message
                  const CustomBodyTextWidget(body: LocalizationKeys.singInBody),
                  //? email text form
                  CustomAppTextForm(
                    myValidator: (val) {
                      return formVaildInput(
                          value: val!, type: 'email', min: 5, max: 50);
                    },
                    myController: controller.email,
                    myKeyboardType: TextInputType.emailAddress,
                    labelText: LocalizationKeys.emailLable,
                    hintText: LocalizationKeys.emailHint,
                    sufixIcon: Icons.email_outlined,
                  ),
                  //? password text form
                  const SizedBox(height: 20),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomAppTextForm(
                      myValidator: (val) {
                        return formVaildInput(
                            value: val!, type: 'password', min: 6, max: 30);
                      },
                      myKeyboardType: TextInputType.visiblePassword,
                      labelText: LocalizationKeys.passLable,
                      hintText: LocalizationKeys.passHint,
                      sufixIcon: controller.isPasswordShow
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      myController: controller.password,
                      isPassword: controller.isPasswordShow,
                      showPassword: () {
                        controller.showPassword();
                      },
                    ),
                  ),
                  //? forget password
                  ForgetPasswordTextWidget(
                    myTap: () {
                      controller.goToforgetPassword();
                    },
                  ),
                  //? sign in button
                  CustomAppBotton(
                    btnText: LocalizationKeys.signIn,
                    btnColor: AppColors.myBlue,
                    textColor: AppColors.myWhite,
                    myPressed: () {
                      controller.login();
                    },
                  ),
                  //? don't have an account text widget
                  HaveOrNotHaveAccountText(
                    firstText: LocalizationKeys.dontHaveAccount,
                    secondText: LocalizationKeys.signUp,
                    //? go th sign up page
                    myTap: () {
                      controller.goToSignUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
