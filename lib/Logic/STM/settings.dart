import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SettingsController extends GetxController{

  static final storage = GetStorage();

  Future<void> changeTheme() async {
    if(!storage.hasData('theme')){
      await storage.write('theme', false);
    }

    if(!storage.read('theme')) {
      Get.changeThemeMode(ThemeMode.dark);
      await storage.write('theme', true);
    } else {
      Get.changeThemeMode(ThemeMode.light);
      await storage.write('theme', false);
    }

    update();
  }

  static bool get theme {
    if(storage.hasData('theme'))
      return storage.read('theme');
    return false;
  }

  Future<void> changeLanguage() async{
    if(!storage.hasData('lang')){
      await storage.write('lang', true);
    }
    if(storage.read('lang')){
      Get.updateLocale(Locale('ar','sy'));
      await storage.write('lang', false);
    }else{
      Get.updateLocale(Locale('en','us'));
      await storage.write('lang', true);
    }
    update();
  }


  static bool get isEn =>
       storage.read('lang') ?? true;

}