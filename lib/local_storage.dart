import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _impl;

  static init() async {
    _impl = await SharedPreferences.getInstance();
  }

  static save(String key, value) {
    if (value is String) {
      _impl.setString(key, value);
    } else if (value is int) {
      _impl.setInt(key, value);
    } else if (value is bool) {
      _impl.setBool(key, value);
    } else if (value is double) {
      _impl.setDouble(key, value);
    } else if (value is List<String>) {
      _impl.setStringList(key, value);
    } else {
      throw UnsupportedError("unsupported-type");
    }
  }

  static get<T>(String key, T? defaultValue) {
    if (T == String) return (_impl.getString(key) ?? defaultValue);
    if (T == int) return _impl.getInt(key) ?? defaultValue;
    if (T == bool) return _impl.getBool(key) ?? defaultValue;
    if (T == double) return _impl.getDouble(key) ?? defaultValue;
    if (T == List<String>) return _impl.getStringList(key) ?? defaultValue;
    throw UnsupportedError("unsupported-type");
  }

  static remove(String key) async {
    await SharedPreferences.getInstance().then((value) => value.remove(key));
  }

  @visibleForTesting
  static removeAll() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
  }
}
