import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mode_store.g.dart';

class ModeStore = ModeStoreBase with _$ModeStore;

abstract class ModeStoreBase with Store {
  @observable
  bool _darkMode = false;

  get darkMode => _darkMode;
  @action
  changeDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _darkMode = !darkMode;

    prefs.setBool("darkMode", darkMode);
  }

  @action
  changeDarkModeLaunch(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool darkmode = prefs.getBool("darkMode");

    if (darkmode != null) _darkMode = darkmode;

    {}
  }
}
