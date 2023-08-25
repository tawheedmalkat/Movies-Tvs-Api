import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/STM/settings.dart';


class SettingsScreen extends StatelessWidget {

  static final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr),),
      body: GetBuilder<SettingsController>(
        init: controller,
        builder: (controller) {
          return ListView(
            children: [
              SwitchListTile(
                  value: SettingsController.theme,
                  onChanged: (v){
                    controller.changeTheme();
                  },
                  activeColor: Colors.red,
                  title: Text(
                    SettingsController.theme ?
                      'Dark'.tr :
                      'Light'.tr
                  ),
                  subtitle: Text('Theme'.tr),
                  secondary: Icon(
                      SettingsController.theme ?
                      Icons.nightlight_outlined:
                      Icons.sunny
                  ),
              ),
              SwitchListTile(
                value: SettingsController.isEn,
                onChanged: (v){
                  controller.changeLanguage();
                },
                activeColor: Colors.red,
                title: Text('English'.tr),
                subtitle:Text('Language'.tr),
                secondary: Icon(Icons.translate),
              ),
            ],
          );
        }
      ),
    );
  }
}
