import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class CheckEmailData {
  final CrudImp crudImp;
  CheckEmailData({required this.crudImp});

  checkData({required String email}) async {
    var response = await crudImp.postData(ApiLink.checkEmail, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
