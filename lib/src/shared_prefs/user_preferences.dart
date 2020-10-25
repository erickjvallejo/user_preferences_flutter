import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _intance = new UserPreferences._internal();

  bool _secondaryColor;
  int _genre;
  String _name;
  String _lastPage;

  factory UserPreferences() {
    return _intance;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();

    this._name = _preferences.getString('name') ?? '';
    this._lastPage = _preferences.getString('lastPage') ?? 'home';
    this._secondaryColor = _preferences.getBool('secondaryColor') ?? false;
    this._genre = _preferences.getInt('genre') ?? 1;
  }

  // Name
  String get name => _name;

  set name(String value) {
    _preferences.setString('name', value);
    _name = value;
  }

  //Genre
  int get genre => _genre;

  set genre(int value) {
    _preferences.setInt('genre', value);
    _genre = value;
  }

  // Secondary Color
  bool get secondaryColor => _secondaryColor;

  set secondaryColor(bool value) {
    _preferences.setBool('secondaryColor', value);
    _secondaryColor = value;
  }

  //last Page
  String get lastPage => _lastPage;

  set lastPage(String value) {
    _preferences.setString('lastPage', value);
    _lastPage = value;
  }



}
