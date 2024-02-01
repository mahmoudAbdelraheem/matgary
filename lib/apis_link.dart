class ApiLink {
  //http://localhost/matgary_backend/test.php
  static const String server = 'http://192.168.1.6/matgary_backend';
  static const String test = '$server/test.php';

  //?  auth api links
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String vrefiyCode = '$server/auth/vrefiycode.php';

  //? forget password
  static const String vrefiyCodePass = '$server/forgetpassword/vrefiycode.php';
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String resetPass = '$server/forgetpassword/resetpassword.php';
}
