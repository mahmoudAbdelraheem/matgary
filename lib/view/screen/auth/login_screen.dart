import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/auth/login_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_title_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/have_or_not_account_text.dart';

import '../../widget/auth/custom_auth_btn_widget.dart';
import '../../widget/auth/custom_text_form_auth.dart';
import '../../widget/auth/forget_password_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

//
  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.signIn),
      body: Form(
        //key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          children: <Widget>[
            //? app logo image
            const CustomAuthLogoWidget(),
            //? welcom back
            const CustomTitleTextWidget(title: LocalizationKeys.welcom),
            //? body message
            const CustomBodyTextWidget(body: LocalizationKeys.singInBody),
            //? email text form
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.emailLable,
              hintText: LocalizationKeys.emailHint,
              sufixIcon: Icons.email_outlined,
              myController: controller.email,
            ),
            //? password text form
            const SizedBox(height: 20),
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.passLable,
              hintText: LocalizationKeys.passHint,
              sufixIcon: Icons.visibility_off_outlined,
              myController: controller.password,
              isPassword: true,
            ),
            //? forget password
            ForgetPasswordTextWidget(
              myTap: () {
                controller.goToforgetPassword();
              },
            ),
            //? sign in button
            CustomAuthBtnWidget(
              btnText: LocalizationKeys.signIn,
              btnColor: AppColors.myBlue,
              textColor: AppColors.myWhite,
              myPressed: () {},
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
    );
  }
}
