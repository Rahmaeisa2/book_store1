import 'package:shared_preferences/shared_preferences.dart';

class appFunction{
 static void saveUserToken(String token)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
 }
}