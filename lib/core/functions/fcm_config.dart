//? this file for flutter cloud messaging (notification)

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:matgary/controller/orders/pending_controller.dart';

import '../constant/routes.dart';

fcmRequestPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPendingOrderScreen(message.data);
  });
}

refreshPendingOrderScreen(Map<String, dynamic> data) {
  if (Get.currentRoute == AppRoutes.pendingScreen &&
      data['pagename'] == 'refreshpendingorders') {
    PendingControllerImp controller = Get.find();
    controller.refreshPendingOrders();
  }
}

initFcmMessageNotification() async {
  await fcmRequestPermission();
  fcmConfig();
}
