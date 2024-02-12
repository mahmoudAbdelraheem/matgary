import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/setting_controller.dart';
import 'package:matgary/view/widget/setting/custom_avatar_widget.dart';
import 'package:matgary/view/widget/setting/custom_card_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          //? build avatar widget
          const CustomAvatarWidget(),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cardInfo.length,
              itemBuilder: (_, index) => CustomCardWidget(
                title: controller.cardInfo[index]['title'],
                icon: controller.cardInfo[index]['icon'],
                onTap: () {
                  switch (index) {
                    case 0:
                      print('case number 0');
                      break;
                    case 1:
                      print('case number 1');
                      break;
                    case 2:
                      print('case number 2');
                      break;
                    case 3:
                      print('case number 3');
                      break;
                    case 4:
                      controller.logout();
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
