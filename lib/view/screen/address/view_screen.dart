import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/address/view_controller.dart';

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
        title: const Text('View Address'),
      ),
      body: const Center(
        child: Text('View Address Screen'),
      ),
    );
  }
}
