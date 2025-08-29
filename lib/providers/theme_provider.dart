import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  final Box _settings = Hive.box('settings');
  
  ThemeMode get themeMode => 
    _settings.get('isDark', defaultValue: true) ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _settings.put('isDark', !_settings.get('isDark', defaultValue: true));
    notifyListeners();
  }
}