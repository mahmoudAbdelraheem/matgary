import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/app_routes.dart';
import 'package:matgary/core/localization/change_local.dart';
import 'package:matgary/core/localization/translation.dart';
import 'package:matgary/my_binding.dart';
import 'core/services/my_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MatgaryApp());
}

class MatgaryApp extends StatelessWidget {
  const MatgaryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController langController = Get.put(LocaleController());

    return GetMaterialApp(
      title: 'Flutter Eeommerce App',
      locale: langController.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: langController.appTheme,
      initialBinding: MyBindings(),

      //home: const PackageText(),
      getPages: routes,
    );
  }
}
// routes management
//1. using Navigator.of(context) without named
// Get.to(PageName());        => push();
// Get.off(PageName())        => pushReplacment();
// Get.offAll(PageName())     => pushAndRemoveUntil();
// Get.back()                 => pop();

//2. using Named
//Get.toNamed("pageName");              =>      pushNamed();
// routes:[                             =>      GetPages:[
// "pageName" : (context)=> PageName(); =>       GetPage(name:"pageName" ,page:()=> PageName()),   
// ]                                    =>      ]  
