import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/localizaion_keys.dart';

import '../widget/language/custom_button_widget.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocalizationKeys.chooseLang.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 50),
            const LanguageCustomButtonWidget(
              buttonText: 'Arabic',
            ),
            const LanguageCustomButtonWidget(
              buttonText: 'English',
            ),
          ],
        ),
      ),
    );
  }
}
