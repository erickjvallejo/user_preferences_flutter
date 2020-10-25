import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';
import 'package:user_preferences/src/widget/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();



  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
        appBar: AppBar(
          title: Text('User Preferences'),
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Secondary Colors: ${prefs.secondaryColor}'),
            Divider(),
            Text('Genre: ${prefs.genre}'),
            Divider(),
            Text('User name: ${prefs.name} '),
            Divider(),
          ],
        ));
  }
}
