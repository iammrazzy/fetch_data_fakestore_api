import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;
  ThemeData get theme => isDark
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true);
  void changeTheme(bool val) {
    box.write('darkmode', val);
    update();
  }

  // change language
  bool isEnglish = false;
  void changeLanguage() {
    var locale = const Locale('en', 'US');
    if (Get.locale == const Locale('en', 'US')) {
      locale = const Locale('km', 'KH');
      isEnglish = true;
    } else {
      locale = const Locale('en', 'US');
      isEnglish = false;
    }
    update();
    Get.updateLocale(locale);
  }
}
