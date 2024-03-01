import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/middleware/my_middleware.dart';
import 'package:matgary/view/screen/address/add_screen.dart';
import 'package:matgary/view/screen/address/update_screen.dart';
import 'package:matgary/view/screen/address/view_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/success_reset_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/vrefiy_code_screen.dart';
import 'package:matgary/view/screen/auth/login_screen.dart';
import 'package:matgary/view/screen/auth/signup_screen.dart';
import 'package:matgary/view/screen/auth/success_sign_up_screen.dart';
import 'package:matgary/view/screen/auth/vrefiy_email_code_screen.dart';
import 'package:matgary/view/screen/check_out_screen.dart';
import 'package:matgary/view/screen/choose_language_screen.dart';
import 'package:matgary/view/screen/home.dart';
import 'package:matgary/view/screen/items_screen.dart';
import 'package:matgary/view/screen/my_favorite_screen.dart';
import 'package:matgary/view/screen/on_boarding_screen.dart';
import 'package:matgary/view/screen/item_details_screen.dart';
import 'package:matgary/view/screen/setting_screen.dart';
import 'package:matgary/view/screen/cart_screen.dart';

List<GetPage<dynamic>> routes = [
  //! on boarding , choose language , auth screens
  GetPage(
    name: '/',
    page: () => const ChooseLanguageScreen(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(
  //   name: '/',
  //   page: () => const TestView(),
  //   //middlewares: [MyMiddleWare()],
  // ),
  GetPage(
    name: AppRoutes.onBoardingScreen,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.signUpScreen,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.successSignUpScreen,
    page: () => const SuccessSignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.vrefiyEmailCodeScreen,
    page: () => const VrefiyEmailCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.forgetPasswordScreen,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.vrefiyCodeScreen,
    page: () => const VrefiyCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.successResetPasswordScreen,
    page: () => const SuccessResetPasswordScreen(),
  ),
  //! home page
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => const Home(),
  ),
  //! categorise items
  GetPage(
    name: AppRoutes.itemsScreen,
    page: () => const ItemsScreen(),
  ),
  //! products details screen
  GetPage(
    name: AppRoutes.itemDetailsScreen,
    page: () => const ItemDetailsScreen(),
  ),
  //! user favorite screen
  GetPage(
    name: AppRoutes.myFavoriteScreen,
    page: () => const MyFavoriteScreen(),
  ),
  //! user setting screen
  GetPage(
    name: AppRoutes.settingScreen,
    page: () => const SettingScreen(),
  ),
  //! cart screen
  GetPage(
    name: AppRoutes.cartScreen,
    page: () => const CartScreen(),
  ),
  //! user address screens
  GetPage(
    name: AppRoutes.addAddressScreen,
    page: () => const AddAddressScreen(),
  ),
  GetPage(
    name: AppRoutes.updateAddressScreen,
    page: () => const UpdateAddressScreen(),
  ),
  GetPage(
    name: AppRoutes.viewAddressScreen,
    page: () => const ViewAddressScreen(),
  ),
  //! user order check out screen
  GetPage(
    name: AppRoutes.checkOutScreen,
    page: () => const CheckOutScreen(),
  ),
];
