import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'controller/address/add_controller.dart';
import 'core/class/handling_data_view.dart';
import 'core/constant/app_colors.dart';
import 'core/shared/custom_app_botton.dart';
import 'view/widget/address/custom_map_widget.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myBlue,
        title: const Text('test data'),
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

            //? second page setting up user data
            Container(
              width: double.infinity,
              color: AppColors.myWhite,
              child: Center(
                child: Row(
                  children: [
                    CustomAppBotton(
                      btnText: 'Back',
                      btnColor: AppColors.myBlue,
                      textColor: AppColors.myWhite,
                      myPressed: () {
                        //? back to the map page
                        controller.backPage();
                      },
                    ),
                    const SizedBox(width: 20),
                    CustomAppBotton(
                      btnText: 'Save',
                      btnColor: AppColors.myBlue,
                      textColor: AppColors.myWhite,
                      myPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// //? location
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // //? animated container
      // //floatingActionButton: CartFloatingActionBtnWidget(),


//  Container(
//             padding: const EdgeInsets.all(8),
//             margin: const EdgeInsets.all(8),
//             width: double.infinity,
//             height: 40,
//             decoration: BoxDecoration(
//               color: AppColors.myBlue,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               'Step 1 Setting Up Your Location ',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.myWhite,
//               ),
//             ),
//           ),