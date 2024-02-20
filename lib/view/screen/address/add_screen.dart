import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:matgary/controller/address/add_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/screen/address/user_address_details.dart';
import '../../widget/address/custom_map_widget.dart';
import '../../../core/shared/custom_app_botton.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: GetBuilder<AddControllerImp>(
        builder: (controller) => PageView(
          controller: controller.myPageController,
          children: [
            //?first page setting up user location
            HandlingDataView(
              statuseRequest: controller.statuseRequest,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (controller.currentLocation != null)
                    CustomMapWidget(
                      currentLocation: controller.currentLocation!,
                      onMapTap: (_, LatLng latLng) {
                        controller.markSelectedLocation(latLng);
                      },
                    ),
                  Positioned(
                    bottom: 10,
                    child: CustomAppBotton(
                      btnText: 'Next',
                      btnColor: AppColors.myBlue,
                      textColor: AppColors.myWhite,
                      myPressed: () {
                        controller.nextPage();
                      },
                    ),
                  ),
                ],
              ),
            ),

            //? second page setting up user address details
            const UserAddressDetails(),
          ],
        ),
      ),
    );
  }
}
