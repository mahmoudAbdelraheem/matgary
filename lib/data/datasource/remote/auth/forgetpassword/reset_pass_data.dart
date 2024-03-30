import '../../../../../apis_link.dart';
import '../../../../../core/class/crud.dart';

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
