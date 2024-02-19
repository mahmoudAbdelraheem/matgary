import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:matgary/core/class/statuse_request.dart';

abstract class AddController extends GetxController {
  //? get currunt user location
  getLocation();
  //? put marker on selected location
  markSelectedLocation(LatLng latLng);
}

class AddControllerImp extends AddController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  //? get current user location
  MapController mapController = MapController();
  LatLng? currentLocation;
  @override
  getLocation() async {
    try {
      statuseRequest = StatuseRequest.loading;
      update();
      Position position = await Geolocator.getCurrentPosition();
      currentLocation = LatLng(position.latitude, position.longitude);
      print('current location = $currentLocation');
      statuseRequest = StatuseRequest.success;
    } catch (e) {
      statuseRequest = StatuseRequest.serverException;
      print("Error: $e");
    }
    update();
  }

//? to mark selected location on the map

  @override
  markSelectedLocation(LatLng latLng) {
    currentLocation = latLng;
    update();
  }

  @override
  void onInit() {
    getLocation();

    super.onInit();
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
}
