import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  final String loginStateKey = 'LOGIN_STATE_KEY';
  final String developerStateKey = 'DEVELOPER_STATE_KEY';

  setLoginState(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loginStateKey, loggedIn);
  }

  Future<bool> getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginState = prefs.getBool(loginStateKey) ?? false;
    return loginState;
  }

  setDeveloperState(bool developerState) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(developerStateKey, developerState);
  }

  Future<bool> getDeveloperState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool developerState = prefs.getBool(developerStateKey) ?? false;
    return developerState;
  }
}
