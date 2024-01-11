import 'package:shared_preferences/shared_preferences.dart';

class GlobalData {
  static String? currentUserUid;

  static Future<void> saveUserUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUid', currentUserUid!);
  }

  static Future<void> loadUserUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserUid = prefs.getString('userUid');
  }
}
