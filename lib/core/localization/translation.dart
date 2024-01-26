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
        },
      };
}
