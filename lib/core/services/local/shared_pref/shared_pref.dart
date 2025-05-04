import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static SharedPreferences? prefs;
  static init()async{
    prefs = await SharedPreferences.getInstance();
  }
 static Future <void> saveData({required String key , required value})async{
    if (value is String) {
      await prefs!.getString(key);
    }else if(value is int){
      await prefs!.getInt(key);
    }else if(value is double){
      await prefs!.getDouble(key);
    }
  }
  static getData(String key){
  prefs!.get(key);
  }
  static removeData(String key)async{
    await prefs!.remove(key);
  }
}
