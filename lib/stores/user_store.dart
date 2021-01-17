import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  static SharedPreferences _pref;
  static final UserStore _instance = UserStore._getInstance();

  factory UserStore() {
    return _instance;
  }

  UserStore._getInstance() {
    SharedPreferences.getInstance().then((pref) => _pref = pref);
  }

  static void setDataToStore({Map<String, dynamic> data}) async {
    if (_pref.getString('StoredUserId') == null) {
      print('here!!!!!!!!!!!');
      // print(_pref.getKeys());
      data.forEach((key, value) {
        if (key is String) {
          _pref.setString(key, value);
        } else if (key is bool) {
          _pref.setBool(key, value);
        } else if (key is int) {
          _pref.setInt(key, value);
        } else if (key is double) {
          _pref.setDouble(key, value);
        } else {
          print('setDataToStore $key is ${key.runtimeType}');
        }
      });
      print(_pref.getKeys());
    }
  }

  static void printKeyInUserStore() {
    print('here is all keys in _pref${_pref.getKeys()}');
  }

  static dynamic getValueFromStore(String key) {
    if (_pref == null) {
      print('_pref = null shit');
      return null;
    }
    return _pref.get(key);
  }
}