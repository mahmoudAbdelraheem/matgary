import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/view_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/class/statuse_request.dart';
import '../../widget/address/custom_address_view_card.dart';

class ViewAddressScreen extends StatelessWidget {
  const ViewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewControllerImp controller = Get.put(ViewControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddAddressScreen();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: GetBuilder<ViewControllerImp>(
        builder: (controller) {
          if (controller.userAddress.isEmpty &&
              controller.statuseRequest != StatuseRequest.defualt &&
              controller.statuseRequest != StatuseRequest.loading) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Let\'s Add New Address For You,\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Click In The Button Below To Start.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(15),
              child: HandlingDataView(
                statuseRequest: controller.statuseRequest,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.userAddress.length,
                  itemBuilder: (_, index) {
                    return CustomAddressViewCard(
                      model: controller.userAddress[index],
                      onTap: () {},
                      onDelete: () {
                        //? delete address from Data base and remove it from list
                        controller.deleteAddress(
                            controller.userAddress[index].addressId!);
                      },
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
