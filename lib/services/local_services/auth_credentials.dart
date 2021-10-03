import 'package:shared_preferences/shared_preferences.dart';

class AuthCredentials {
  static const String key = "userId";
  static const String noUser = "null";

  static Future<String> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(key) ?? noUser;
    return userId;
  }

  static Future<void> addUser({required String userId}) async {
    String check = await getUser();
    if (check == noUser) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(key, userId);
    } else {
      throw "user already available";
    }
  }

  static Future<void> removeUser() async {
    String check = await getUser();
    if (check != noUser) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove(key);
    } else {
      throw "no user available";
    }
  }
}
