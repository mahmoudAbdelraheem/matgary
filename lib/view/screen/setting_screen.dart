import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/setting_controller.dart';
import '../widget/setting/custom_avatar_widget.dart';
import '../widget/setting/custom_card_widget.dart';

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
                      //? disable notify
                      //? to disable notification by do nu
                      //!FirebaseMessaging.instance.unSubscribeToTopic('users');
                      //!FirebaseMessaging.instance.unSubscribeToTopic('users$userId');
                      //?
                      print('case number 0');
                      break;
                    case 1:
                      controller.goToUserAddressScreen();
                      break;
                    case 2:
                      //?
                      controller.contactUS();
                      break;
                    case 3:
                      //? about US
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
