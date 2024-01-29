import 'package:get/get.dart';

formVaildInput({
  required String value,
  required String type,
  required int min,
  required int max,
}) {
  //? check user name
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return 'Not valid user name!';
    }
  }
  //? check email
  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'Not valid email !';
    }
  }
  //? check phone
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Not valid phone !';
    }
  }

  //? check value length
  if (value.isEmpty) {
    return "this  feild can't be empty!";
  }

  if (value.length < min) {
    return "can't be less than $min !";
  }
  if (value.length > max) {
    return "can't be more than $max !";
  }
}
