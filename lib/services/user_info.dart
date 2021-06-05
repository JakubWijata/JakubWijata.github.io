import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  String _name = "";
  bool _isLogin = false;
  String _token = "";

  String get token => _token;
  String get name => _name;
  bool get isLogin => _isLogin;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}
