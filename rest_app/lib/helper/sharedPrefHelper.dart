import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static var isLoggedInKey = "isLoggedIn";

  static SharedPreferences _pref;

  static void insertStringData({String key, String value}) async{
    _pref = await SharedPreferences.getInstance();

    _pref.setString(key, value);
  }

  static void insertBoolData({String key, bool value}) async{
    _pref = await SharedPreferences.getInstance();

    _pref.setBool(key, value);
  }

  static void insertIntData({String key, int value}) async{
    _pref = await SharedPreferences.getInstance();

    _pref.setInt(key, value);
  }

  static getStringData({String key}) async{
    _pref = await SharedPreferences.getInstance();

    return _pref.getString(key);
  }

  static getBoolData({String key}) async{
    _pref = await SharedPreferences.getInstance();

    return _pref.getBool(key);
  }

  static getIntData({String key}) async{
    _pref = await SharedPreferences.getInstance();

    return _pref.getInt(key);
  }
}