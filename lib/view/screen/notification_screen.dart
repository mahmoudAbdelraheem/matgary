import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:matgary/controller/notification_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: GetBuilder<NotificationControllerImp>(
        builder: (controller) => HandlingDataView(
          statuseRequest: controller.statuseRequest,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: controller.notifications.length,
              itemBuilder: (_, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //? message title
                          Text(
                            '${controller.notifications[index].notificationTitle}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.myBlack,
                            ),
                          ),
                          //? message date time
                          Text(
                            Jiffy.parse(controller
                                    .notifications[index].notificationDateTime!)
                                .fromNow(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.myBlack,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //? message body
                          Text(
                            '${controller.notifications[index].notificationBody}',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.myBlack,
                              height: 1.5,
                            ),
                          ),
                          //? delete message icon
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outlined,
                                color: AppColors.myRed,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
