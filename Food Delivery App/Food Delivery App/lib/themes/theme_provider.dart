import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _notificationsEnabled = true; // Thêm trạng thái này
  String _selectedLanguage = 'vi';

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darktMode;
  bool get notificationsEnabled => _notificationsEnabled;
  String get selectedLanguage => _selectedLanguage;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darktMode;
    } else {
      themeData = lightMode;
    }
  }

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }

  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
