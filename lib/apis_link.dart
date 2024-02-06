class ApiLink {
  //http://localhost/matgary_backend/test.php
  static const String server = 'http://192.168.1.6/matgary_backend';
  static const String test = '$server/test.php';

  //? database images
  static const String rootImage = 'http://192.168.1.6/matgary_backend/upload';
  static const String categoriesImg = '$rootImage/categories';
  static const String itemsImg = '$rootImage/items';

  //?  auth api links
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String vrefiyCode = '$server/auth/vrefiycode.php';

  //? forget password
  static const String vrefiyCodePass = '$server/forgetpassword/vrefiycode.php';
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String resetPass = '$server/forgetpassword/resetpassword.php';

  //? home page
  static const String home = '$server/home.php';

  //? all categories
  static const String categories = '$server/categories/view.php';

  //? items view data
  static const String itemsView = '$server/items/itemsview.php';
}
