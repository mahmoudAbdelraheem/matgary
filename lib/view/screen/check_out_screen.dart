import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/check_out_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/app_image_assets.dart';
import 'package:matgary/view/widget/ckeckout/coustom_chek_out_text.dart';
import 'package:matgary/view/widget/ckeckout/coustom_delivery_type.dart';
import 'package:matgary/view/widget/ckeckout/coustom_payment_method.dart';
import 'package:matgary/view/widget/ckeckout/coustom_shipping_address.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MaterialButton(
          height: 50,
          textColor: AppColors.myWhite,
          color: AppColors.myBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {},
          child: const Text(
            'Check Out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: GetBuilder<CheckOutControllerImp>(
        builder: (controller) => HandlingDataView(
          statuseRequest: controller.statuseRequest,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                //? payment section
                const CoustomCheckOutText(title: 'Choose Payment Method.'),
                CustomPaymentMethod(
                  title: 'Payment Card',
                  isSelected: controller.paymentMethod == 'Card' ? true : false,
                  onTap: () {
                    controller.choosePaymentMethod('Card');
                  },
                ),
                CustomPaymentMethod(
                  title: 'Cash On Delivery',
                  isSelected: controller.paymentMethod == 'Cash' ? true : false,
                  onTap: () {
                    controller.choosePaymentMethod('Cash');
                  },
                ),
                //? Delivery section
                const CoustomCheckOutText(title: 'Choose Delivery Type.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDeliveryType(
                      image: AppImageAssets.delivery,
                      title: 'Delivery',
                      isSelected:
                          controller.deliveryType == 'Delivery' ? true : false,
                      onTap: () {
                        controller.chooseDeliveryType('Delivery');
                      },
                    ),
                    CustomDeliveryType(
                      image: AppImageAssets.driveThru,
                      title: 'Drive Thru',
                      isSelected: controller.deliveryType == 'Drive Thru'
                          ? true
                          : false,
                      onTap: () {
                        controller.chooseDeliveryType('Drive Thru');
                      },
                    ),
                  ],
                ),
                //? address section
                if (controller.deliveryType == 'Delivery')
                  Column(
                    children: [
                      const CoustomCheckOutText(title: 'Shipping Address.'),
                      ...List.generate(
                        controller.userAddress.length,
                        (index) => CustomShippingAddress(
                          addressName:
                              "${controller.userAddress[index].addressName}",
                          addressCity:
                              "${controller.userAddress[index].addressCity} - ${controller.userAddress[index].addressStreet}",
                          isSelected: controller.userAddress[index].addressId ==
                                  controller.addressId
                              ? true
                              : false,
                          onTap: () {
                            controller.chooseAddressId(
                                controller.userAddress[index].addressId!);
                          },
                        ),
                      ),
                    ],
                  )
                // todo if user dont have any address
                // else if (controller.deliveryType == 'Delivery' &&
                //     controller.userAddress.isEmpty)
                //   Center(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           'You Don\'t Have Any Address\nLet\'s Add One',
                //           style: TextStyle(
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold,
                //             color: AppColors.myBlack,
                //             height: 2,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(height: 10),
                //         MaterialButton(
                //           onPressed: () {},
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           color: AppColors.myBlue,
                //           textColor: AppColors.myWhite,
                //           child: const Text(
                //             'Add Address',
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
