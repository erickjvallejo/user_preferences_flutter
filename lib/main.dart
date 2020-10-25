import 'package:flutter/material.dart';
import 'package:user_preferences/src/page/home_page.dart';
import 'package:user_preferences/src/page/settings.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingPage.routeName: (BuildContext context) => SettingPage(),
      },
      home: Container(),
    );
  }
}
