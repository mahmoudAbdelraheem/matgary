import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/defualt_alert_dialog.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/models/address_model.dart';

abstract class ViewController extends GetxController {
  //? for location permission
  requestLocationPermission();
  //? go to add user address screen
  goToAddAddressScreen();
  //? Get saved user Address in data base
  getAllAddress();
  //? delete address from database
  deleteAddress(String addressId);
}

class ViewControllerImp extends ViewController {
  //? for request user permission
  bool? serviceEnabled;
  LocationPermission? permission;

  List<AddressModel> userAddress = [];
  final AddressData _addressData = AddressData(crudImp: Get.find());
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();

  @override
  getAllAddress() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _addressData.viewData(
      userId: _myServices.sharedPreferences.getString('id')!,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        userAddress.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  deleteAddress(String addressId) {
    _addressData.removeData(
      addressId: addressId,
    );

    userAddress.removeWhere((element) => element.addressId == addressId);

    update();
  }

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
  void onInit() async {
    await getAllAddress();
    requestLocationPermission();
    super.onInit();
  }
}
