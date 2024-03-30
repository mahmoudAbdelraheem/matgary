import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/address_data.dart';

abstract class AddController extends GetxController {
  //? to iniatialize all data
  initializData();
  //? get currunt user location
  getLocation();
  //? put marker on selected location
  markSelectedLocation(LatLng latLng);
  //? add User Address Details to myDB
  addUserAddress();
}

class AddControllerImp extends AddController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  //? get current user location
  MapController mapController = MapController();
  LatLng? currentLocation;

  //? for secound page view address details
  late GlobalKey<FormState> formState;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController nameController;

  final AddressData _addressData = AddressData(crudImp: Get.find());
  final MyServices _myServices = Get.find();

  @override
  initializData() {
    //? form first page
    getLocation();
    //? for second page
    cityController = TextEditingController();
    streetController = TextEditingController();
    nameController = TextEditingController();
    formState = GlobalKey<FormState>();
  }

  @override
  getLocation() async {
    try {
      statuseRequest = StatuseRequest.loading;
      update();
      Position position = await Geolocator.getCurrentPosition();
      currentLocation = LatLng(position.latitude, position.longitude);
      //print('current location = $currentLocation');
      statuseRequest = StatuseRequest.success;
    } catch (e) {
      statuseRequest = StatuseRequest.serverException;
      //print("Error: $e");
    }
    update();
  }

//? to mark selected location on the map

  @override
  markSelectedLocation(LatLng latLng) {
    currentLocation = latLng;
    update();
  }

  //? for page view
  PageController myPageController = PageController();

  nextPage() {
    myPageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    update();
  }

  backPage() {
    myPageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    update();
  }

//? add user data
  @override
  addUserAddress() async {
    if (formState.currentState!.validate()) {
      statuseRequest = StatuseRequest.loading;
      update();
      var response = await _addressData.addData(
        userId: _myServices.sharedPreferences.getString('id')!,
        name: nameController.text,
        street: streetController.text,
        city: cityController.text,
        lat: currentLocation!.latitude.toString(),
        long: currentLocation!.longitude.toString(),
      );
      //print('respond of add address = $response');
      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.homeScreen);
          Get.snackbar('Success', 'Now You Can Order To this address.');
        } else {
          statuseRequest = StatuseRequest.failuer;
          //? make user to try add data again
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    initializData();
    super.onInit();
  }
}
