import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        children: <Widget>[
          Text(
            LocalizationKeys.welcom.tr,
            style: TextStyle(
              fontSize: 30,
              color: AppColors.myBlack,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            LocalizationKeys.bodyMessage.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.myGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text(LocalizationKeys.emailLable.tr),
              hintText: LocalizationKeys.emailHint.tr,
              suffixIcon: const Icon(Icons.email_outlined),
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        LocalizationKeys.signIn.tr,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColors.myGrey),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 100,
    );
  }
}
