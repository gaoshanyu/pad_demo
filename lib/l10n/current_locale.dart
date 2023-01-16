import 'dart:io';

import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(Platform.localeName.split("_")[0]);

  Locale get value => _locale;

  void setLocale(locale) {
    _locale = locale;
    notifyListeners();
  }
}
