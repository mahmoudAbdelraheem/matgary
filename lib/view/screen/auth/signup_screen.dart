import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';

import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_title_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/have_or_not_account_text.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../widget/auth/custom_auth_btn_widget.dart';
import '../../widget/auth/custom_text_form_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

//
  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.signUp),
      body: Form(
        //key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          children: <Widget>[
            //? welcom back
            const CustomTitleTextWidget(title: LocalizationKeys.welcom),
            //? body message
            const CustomBodyTextWidget(body: LocalizationKeys.singUpBody),
            //? name text form
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.userLable,
              hintText: LocalizationKeys.userHint,
              sufixIcon: Icons.person_2_outlined,
              myController: controller.name,
            ),

            //? email text form
            const SizedBox(height: 20),
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.emailLable,
              hintText: LocalizationKeys.emailHint,
              sufixIcon: Icons.email_outlined,
              myController: controller.email,
            ),
            //? phone text form
            const SizedBox(height: 20),
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.phoneLable,
              hintText: LocalizationKeys.phoneHint,
              sufixIcon: Icons.phone_android_outlined,
              myController: controller.phone,
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

            //? go to check email address screen button
            CustomAuthBtnWidget(
              btnText: LocalizationKeys.signUp,
              btnColor: AppColors.myBlue,
              textColor: AppColors.myWhite,
              myPressed: () {
                controller.goToCheckEmail();
              },
            ),
            //? don't have an account text widget
            HaveOrNotHaveAccountText(
              firstText: LocalizationKeys.haveAccount,
              secondText: LocalizationKeys.signIn,
              myTap: () {
                controller.goToLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
