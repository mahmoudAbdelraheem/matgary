import 'package:get/get.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          //? choose language screen
          LocalizationKeys.chooseLang: 'أختر اللغة.',

          //? on boarding screen
          LocalizationKeys.onBoardingTitleOne: 'أختار منتجك',
          LocalizationKeys.onBoardingBodyOne:
              'يوجد أكثر من ألف منتج\nأختار ماتحتاجة من المنتجات.',
          LocalizationKeys.onBoardingTitleTwo: 'دفع إلكترونى آمن وسهل',
          LocalizationKeys.onBoardingBodyTwo:
              'طريقة الدفع الإلكترونى أمنه وسهلة.\nموثوقة من جميع عملائنا.',
          LocalizationKeys.onBoardingTitleThree: 'تتبع طلبك',
          LocalizationKeys.onBoardingBodythree:
              'أفضل طريقة لتتبع طلبك.\nيمكنك معرفة موقع طلبك\nفى إى وقت.',
          LocalizationKeys.onBoardingTitleFour: 'توصيل سريع',
          LocalizationKeys.onBoardingBodyFour: 'توصيل المنتجات بأسرع وقت.',
          LocalizationKeys.continueBtn: 'التالى',

          //? Sing In Screen
          LocalizationKeys.signIn: 'تسجيل دخول',
          LocalizationKeys.welcom: 'أهلا بعودتك',
          LocalizationKeys.singInBody:
              'يمكنك تسجيل دخول بالإميل وكلمة المرور\nأو يمكنك الإستمرار بإستخدام\nوسائل التواصل الإجتماعية.',
          LocalizationKeys.emailLable: 'الإميل',
          LocalizationKeys.emailHint: 'أدخل الإميل الخاص بك',
          LocalizationKeys.passLable: 'كلمة المرور',
          LocalizationKeys.passHint: 'أدخل كلمة المرور الخاصه بك',
          LocalizationKeys.forgetPassword: 'نسيت كلمة المرور ؟',
          LocalizationKeys.dontHaveAccount: 'ليس لديك حساب ؟ ',

          //? sign Up Screen
          LocalizationKeys.signUp: 'تسجيل حساب',
          LocalizationKeys.singUpBody:
              'يمكنك تسجيل حساب جديد بالإميل وكلمة المرور\nأو يمكنك الإستمرار بإستخدام\nوسائل التواصل الإجتماعية.',

          LocalizationKeys.userLable: 'إسم الحساب',
          LocalizationKeys.userHint: 'أدخل إسم الحساب',
          LocalizationKeys.phoneLable: 'رقم الهاتف',
          LocalizationKeys.phoneHint: 'أدخل رقم الهاتف',
          LocalizationKeys.haveAccount: 'لديك حساب ؟ ',
          LocalizationKeys.check: 'تحقق',

          //? forget password
          LocalizationKeys.forgetPasswordBody:
              'أدخل الإميل الإلكترونى لإستقبال\nكود التحقيق! ',

          LocalizationKeys.vrefiyCodeTitle: 'التحقق من الرقم',
          LocalizationKeys.vrefiyCodeBody: 'برجاء إدخال الرقم المرسل إلى\n',
        },
        'en': {
          //? choose language screen
          LocalizationKeys.chooseLang: 'Choose Language.',

          //? on boarding screen
          LocalizationKeys.onBoardingTitleOne: 'Choose Product',
          LocalizationKeys.onBoardingBodyOne:
              'We Have a 100K+ Products. Choose\nYour Product From Our\nMatgary Shop',
          LocalizationKeys.onBoardingTitleTwo: 'Easy & Save Payment',
          LocalizationKeys.onBoardingBodyTwo:
              'Easy Checkout And Save Payment\nmethod. Trusted By Our Customers\nfrom all over the world.',
          LocalizationKeys.onBoardingTitleThree: 'Track Your Order',
          LocalizationKeys.onBoardingBodythree:
              "Best Tracker has been Used for\nTrack your order. You'll Know where\nYour Product is at the moment.",
          LocalizationKeys.onBoardingTitleFour: 'Fast Delivery',
          LocalizationKeys.onBoardingBodyFour:
              'Reliable And Fast Delivery. We\nDeliver Your product the fastest\nway possible.',
          LocalizationKeys.continueBtn: 'Continue',

          //? Sing In Screen
          LocalizationKeys.signIn: 'Sign In',

          LocalizationKeys.welcom: 'Welcom Back',
          LocalizationKeys.singInBody:
              'Sign In With Your Email & Password\nOr Continue With Social Media.',
          LocalizationKeys.emailLable: 'Email',
          LocalizationKeys.emailHint: 'Enter Your Email',
          LocalizationKeys.passLable: 'Password',
          LocalizationKeys.passHint: 'Enter Your Password',
          LocalizationKeys.forgetPassword: 'Forget Password ?',
          LocalizationKeys.dontHaveAccount: "Don't Have An Account ? ",

          //? Sign Up Screen
          LocalizationKeys.signUp: 'Sign Up',
          LocalizationKeys.singUpBody:
              'Sign Up With Your Email & Password\nOr Continue With Social Media.',
          LocalizationKeys.userLable: 'User Name',
          LocalizationKeys.userHint: 'Enter User Name',
          LocalizationKeys.phoneLable: 'Phone Number',
          LocalizationKeys.phoneHint: 'Enter Phone Number',
          LocalizationKeys.haveAccount: 'Have An Account ? ',

          //? forget password
          LocalizationKeys.forgetPasswordBody:
              'Enter Your Email to Recive a\nVerification Code ! ',
          LocalizationKeys.check: 'Check',
          LocalizationKeys.vrefiyCodeTitle: 'Vreification Code',
          LocalizationKeys.vrefiyCodeBody:
              'Please Enter The Digit Code Sent To\n',
        },
      };
}
