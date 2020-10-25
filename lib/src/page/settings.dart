import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';
import 'package:user_preferences/src/widget/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _secondaryColor;
  int _genre;
  String _name;

  TextEditingController _textEditingController;

  final prefs = new UserPreferences();

  @override
  Future<void> initState() {
    super.initState();

    _genre = prefs.genre;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.name;
    prefs.lastPage = SettingPage.routeName;

    _textEditingController = new TextEditingController(text: _name);
  }

  _setSelectedRadio(int value) {
    _genre = value;
    prefs.genre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Setup',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                )),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('Secondary Color'),
              onChanged: (value) {
                setState(() {
                  _secondaryColor = value;
                  prefs.secondaryColor = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femal'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    helperText: 'Name of de person using the telephone'),
                onChanged: (value) {
                  prefs.name = value;
                },
              ),
            )
          ],
        ));
    ;
  }
}
