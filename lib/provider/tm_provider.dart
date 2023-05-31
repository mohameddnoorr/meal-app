
import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier{


  ThemeMode tm=ThemeMode.light;
  bool isDark = false;
  void switchThemeMode(bool switchState) {
    isDark = switchState;
    if(isDark ==false){
      tm=ThemeMode.light;
    }else{
      tm=ThemeMode.dark;
    }
    notifyListeners();
  }

}