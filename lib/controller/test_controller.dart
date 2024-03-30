import 'package:get/get.dart';
import '../core/class/statuse_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(crudImp: Get.find());

  List data = [];
  late StatuseRequest statuseRequest;

  getData() async {
    statuseRequest = StatuseRequest.loading;
    var response = await testData.getData();
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  bool isOpen = false;

  changeContainerHeigth() {
    isOpen = !isOpen;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
