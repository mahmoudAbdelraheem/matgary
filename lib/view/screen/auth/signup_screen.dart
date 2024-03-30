import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/localizaion_keys.dart';
import '../../../core/functions/exit_app_alert.dart';
import '../../../core/functions/form_valid_input.dart';
import '../../widget/auth/custom_body_text_widget.dart';
import '../../widget/auth/custom_title_text_widget.dart';
import '../../widget/auth/custom_app_bar_widget.dart';
import '../../widget/auth/have_or_not_account_text.dart';
import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/shared/custom_app_botton.dart';
import '../../../core/shared/custom_app_text_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBarWidget(title: LocalizationKeys.signUp),
        //?
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              return;
            } else {
              exitAppAlert();
            }
          },
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(
                statuseRequest: controller.statuseRequest,
                myPressed: () {
                  controller.tryAgain();
                },
                child: Form(
                  key: controller.signUpFormState,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 35),
                    children: <Widget>[
                      //? welcom back
                      const CustomTitleTextWidget(
                          title: LocalizationKeys.welcom),
                      //? body message
                      const CustomBodyTextWidget(
                          body: LocalizationKeys.singUpBody),
                      //? name text form
                      CustomAppTextForm(
                        myValidator: (val) {
                          return formVaildInput(
                            value: val!,
                            type: 'username',
                            min: 5,
                            max: 30,
                          );
                        },
                        myKeyboardType: TextInputType.name,
                        labelText: LocalizationKeys.userLable,
                        hintText: LocalizationKeys.userHint,
                        sufixIcon: Icons.person_2_outlined,
                        myController: controller.name,
                      ),

                      //? email text form
                      const SizedBox(height: 20),
                      CustomAppTextForm(
                        myValidator: (val) {
                          return formVaildInput(
                            value: val!,
                            type: 'email',
                            min: 6,
                            max: 50,
                          );
                        },
                        myKeyboardType: TextInputType.emailAddress,
                        labelText: LocalizationKeys.emailLable,
                        hintText: LocalizationKeys.emailHint,
                        sufixIcon: Icons.email_outlined,
                        myController: controller.email,
                      ),
                      //? phone text form
                      const SizedBox(height: 20),
                      CustomAppTextForm(
                        myValidator: (val) {
                          return formVaildInput(
                            value: val!,
                            type: 'phone',
                            min: 8,
                            max: 15,
                          );
                        },
                        myKeyboardType: TextInputType.phone,
                        labelText: LocalizationKeys.phoneLable,
                        hintText: LocalizationKeys.phoneHint,
                        sufixIcon: Icons.phone_android_outlined,
                        myController: controller.phone,
                      ),
                      //? password text form
                      const SizedBox(height: 20),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomAppTextForm(
                          myValidator: (val) {
                            return formVaildInput(
                              value: val!,
                              type: 'password',
                              min: 6,
                              max: 30,
                            );
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

                      //? go to check email address code
                      CustomAppBotton(
                        btnText: LocalizationKeys.signUp,
                        btnColor: AppColors.myBlue,
                        textColor: AppColors.myWhite,
                        myPressed: () {
                          controller.signUp();
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
            },
          ),
        ));
  }
}
