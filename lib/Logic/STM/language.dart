import 'package:get/get.dart';

class Languages extends Translations{


  @override
  Map<String, Map<String, String>> get keys =>{
    'en_us':{
      'Movies' : 'Movies',
      'TVs':'TVs',
      'Settings':'Settings',
      'Search':'Search',
      'Dark':'Dark',
      'Light':'Light',
      'Language':'Language',
      'English':'English',
      'Theme':'Theme'
    },
    'ar_sy':{
      'Movies' : 'الأفلام',
      'TVs':'المسلسلات',
      'Settings':'الإعدادات',
      'Search':'بحث',
      'Dark':'ليلي',
      'Light':'نهاري',
      'Language':'اللغة',
      'English':'العربية',
      'Theme':'الوضع'
    },

  };
}