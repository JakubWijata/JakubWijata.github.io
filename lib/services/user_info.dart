import 'package:flutter/material.dart';
import 'package:www/models/user.dart';

class UserInfo extends ChangeNotifier {
  bool _isLogin = false;
  String _token = "";
  User _user;

  String get token => _token;
  User get user => _user;
  bool get isLogin => _isLogin;

  set user(User user) {
    _user = user;
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
