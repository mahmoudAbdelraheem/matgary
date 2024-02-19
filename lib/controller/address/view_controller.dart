import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/defualt_alert_dialog.dart';

abstract class ViewController extends GetxController {
  //? for location permission
  requestLocationPermission();
  //? go to add user address screen
  goToAddAddressScreen();
}

class ViewControllerImp extends ViewController {
  //? for request user permission
  bool? serviceEnabled;
  LocationPermission? permission;
  @override
  requestLocationPermission() async {
    //? Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      return defualtAlertDialog('Warring', 'Please Enable Location Service');
    }
    //? check app permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //? request location permission for app
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return defualtAlertDialog(
            'Warring', 'Please Enable Location Service To Countinue');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      //? Permissions are denied forever, handle appropriately.
      return defualtAlertDialog('Warring', 'You Can\'t Use App');
    }
  }

  @override
  goToAddAddressScreen() {
    Get.toNamed(AppRoutes.addAddressScreen);
  }

  @override
  void onInit() {
    requestLocationPermission();
    super.onInit();
  }
}
