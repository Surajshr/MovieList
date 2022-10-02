import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils{

  static late SharedPreferences preferences;



  static  initPreference() async{
    preferences = await SharedPreferences.getInstance();

  }


  static setString(String value, String key) {
    preferences.setString(key, value);
  }


  static getString(String key) {
    var value = preferences.getString(key);
    return value;
  }

  static setBool(bool value, String key){
    preferences.setBool(key, value);

  }

  static getBool(String key){
    var value = preferences.getBool(key);
    return value;

  }

  static setStringList(String key, List<String> value){
    preferences.setStringList(key, value);
  }

  static getStringList(String key){
    var value = preferences.getStringList(key);
    return value;
  }

  static clearData(){
    preferences.clear();
  }

}