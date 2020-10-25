import 'package:flutter/material.dart';
import 'package:user_preferences/src/page/home_page.dart';
import 'package:user_preferences/src/page/settings.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
            child: Container(),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.pages, color: Colors.blue),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            title: Text('Maps'),
            leading: Icon(Icons.map, color: Colors.blue),
            onTap: () {},
          ),
          ListTile(
            title: Text('Keyboard'),
            leading: Icon(Icons.keyboard, color: Colors.blue),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings, color: Colors.blue),
            onTap: () {
/*              Navigator.pop(context);
              Navigator.pushNamed(context, SettingPage.routeName);*/
              Navigator.pushReplacementNamed(context, SettingPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
