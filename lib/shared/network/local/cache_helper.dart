import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper  { // cache data
  static late SharedPreferences sharedPreferences ;
  static init () async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> putData ({ // saving cache data
    required String key ,
    required bool value ,
  })async{
    return await sharedPreferences.setBool(key, value);
  }
  static bool getData({ // get cache data
    required String key ,
  }){
    return sharedPreferences.getBool(key)??false;
  }
}