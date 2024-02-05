import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/remote/home_date.dart';

abstract class HomeScreenController extends GetxController {
  getUserDate();
  getHomeDate();
}

class HomeScreenControllerImp extends HomeScreenController {
  final MyServices _myServices = Get.find();
  String? name;
  String? email;
  String? phone;
  //? home data
  List categories = [];
  List items = [];
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final HomeData _homeData = HomeData(crudImp: Get.find());

  @override
  getUserDate() {
    name = _myServices.sharedPreferences.getString('name');
    email = _myServices.sharedPreferences.getString('email');
    phone = _myServices.sharedPreferences.getString('phone');
  }

  @override
  getHomeDate() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _homeData.getData();
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      }
    }
    update();
  }

  @override
  void onInit() {
    getUserDate();
    getHomeDate();
    super.onInit();
  }
}
