import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference{
 static SharedPreferences? _preferences;
static String key="userChild";
static init()async{
 _preferences =await SharedPreferences.getInstance();
  return _preferences;
 }

 static Future saveUserType(String type)async{
  return await _preferences!.setString(key, type);
 }

/// first k liye ye kia ta kam kar raha ta without futureBuilder

// static String? getUserType(){
//  return  _preferences!.getString(key);
//  }
 static Future<String>? getUserType()async{
 return await _preferences!.getString(key)??"";
 }

}