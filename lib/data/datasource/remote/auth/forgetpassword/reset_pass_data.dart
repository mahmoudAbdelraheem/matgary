import 'package:matgary/apis_link.dart';
import 'package:matgary/core/class/crud.dart';

class ResetPasswordData {
  final CrudImp crudImp;
  ResetPasswordData({required this.crudImp});

  resetData({required String email, required String newPass}) async {
    var response = await crudImp.postData(ApiLink.resetPass, {
      'email': email,
      'password': newPass,
    });
    return response.fold((l) => l, (r) => r);
  }
}
