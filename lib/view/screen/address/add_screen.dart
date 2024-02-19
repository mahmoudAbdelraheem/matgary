import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:matgary/controller/address/add_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import '../../widget/address/custom_map_widget.dart';

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
        builder: (controller) => HandlingDataView(
          statuseRequest: controller.statuseRequest,
          child: Column(
            children: [
              if (controller.currentLocation != null)
                Expanded(
                  child: Stack(
                    children: [
                      //? show map with current user location
                      //? mark selected location on tap
                      CustomMapWidget(
                        currentLocation: controller.currentLocation!,
                        onMapTap: (_, LatLng latLng) {
                          controller.markSelectedLocation(latLng);
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
