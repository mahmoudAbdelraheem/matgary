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

import '../widget/ckeckout/add_address_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    //? page scaffold
    return GetBuilder<CheckOutControllerImp>(
      builder: (controller) => Scaffold(
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
            onPressed: () {
              controller.orderCheckOut();
            },
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
        body: HandlingDataView(
          statuseRequest: controller.statuseRequest,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                //? payment section
                const CoustomCheckOutText(title: 'Choose Payment Method.'),
                CustomPaymentMethod(
                  title: 'Payment Card',
                  isSelected: controller.paymentMethod == '0' ? true : false,
                  onTap: () {
                    controller.choosePaymentMethod('0');
                  },
                ),
                CustomPaymentMethod(
                  title: 'Cash On Delivery',
                  isSelected: controller.paymentMethod == '1' ? true : false,
                  onTap: () {
                    controller.choosePaymentMethod('1');
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
                      isSelected: controller.deliveryType == '0' ? true : false,
                      onTap: () {
                        controller.chooseDeliveryType('0');
                      },
                    ),
                    CustomDeliveryType(
                      image: AppImageAssets.driveThru,
                      title: 'Drive Thru',
                      isSelected: controller.deliveryType == '1' ? true : false,
                      onTap: () {
                        controller.chooseDeliveryType('1');
                      },
                    ),
                  ],
                ),

                //? address section
                if (controller.deliveryType == '0')
                  controller.userAddress.isEmpty
                      ? AddAdressWidget(onTap: () {
                          controller.goToAddAddress();
                        })
                      : Column(
                          children: [
                            const CoustomCheckOutText(
                                title: 'Shipping Address.'),
                            ...List.generate(
                              controller.userAddress.length,
                              (index) => CustomShippingAddress(
                                addressName:
                                    "${controller.userAddress[index].addressName}",
                                addressCity:
                                    "${controller.userAddress[index].addressCity} - ${controller.userAddress[index].addressStreet}",
                                isSelected:
                                    controller.userAddress[index].addressId ==
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
                        ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
