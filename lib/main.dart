import 'package:e_shop/translation/translation.dart';
import 'package:e_shop/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/app_controller.dart';

void main() async {
  // for change them mode using GetStorage as local storage
  await GetStorage.init();
  runApp(const MyApp());
}

// theme controller with GetX
AppController controller = Get.put(AppController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.theme,
          translations: AppTranslation(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          home: const Home(),
        );
      },
    );
  }
}
