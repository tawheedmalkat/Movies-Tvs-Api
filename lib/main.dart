import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/STM/language.dart';
import 'package:my_tv/Logic/STM/settings.dart';
import 'package:my_tv/UI/Screens/Movies.dart';
import 'package:my_tv/UI/Screens/TV.dart';
import 'UI/Screens/Settings.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                    AppBar().preferredSize.height*0.5
                ),
            )
          )
        ),
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,

      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      AppBar().preferredSize.height*0.5
                  ),
                )
            )
        ),
      ),

    themeMode: SettingsController.theme ?
    ThemeMode.dark :
    ThemeMode.light,

    debugShowCheckedModeBanner: false,


      home: MoviesScreen(),
      getPages: [
        GetPage(name: '/movies', page: () => MoviesScreen()),
        GetPage(name: '/tvs', page: () => TVScreen()),
        GetPage(name: '/settings', page: ()=>SettingsScreen())
      ],
      locale:SettingsController.isEn ?
      Locale('en','us'):
      Locale('ar','sy'),
      translations: Languages(),
    );
  }
}
