import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefService {
  late SharedPreferences prefs;
  Future<void> initialPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
