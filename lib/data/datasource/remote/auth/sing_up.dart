import '../../../../apis_link.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  final CrudImp crudImp;

  SignUpData({required this.crudImp});

  postData({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    var response = await crudImp.postData(ApiLink.signup, {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });
    return response.fold((failuer) => failuer, (correct) => correct);
  }
}
