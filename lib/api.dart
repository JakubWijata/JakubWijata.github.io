import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:www/internet_connection.dart';
import 'package:www/services/user_info.dart';
import 'package:www/show_toast.dart';
import 'models/user.dart';
import 'models/user_login.dart';
import 'models/user_register.dart';

class ApiProvider {
  final String url = "animal-clinic.herokuapp.com";

  Future<User> login(UserLogin userLogin, BuildContext context) async {
    assert(userLogin != null);

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    var body = json.encode({"user": userLogin});

    Uri _uri = Uri.http(url, "/users/sign_in");
    try {
      final response = await http
          .post(_uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body)['data']);
        try {
          final userinfo = context.watch<UserInfo>();
          userinfo.token = response.headers['authorization'];
          userinfo.user = user;
        } on Exception catch (_) {
          return null;
        }

        return user;
      } else {
        Map errorInfo = json.decode(response.body);
        errorInfo.forEach((key, value) =>
            {showToast('${value[0]}', Colors.white, Colors.red)});
        return null;
      }
    } on ConnectionInternetException catch (_) {
      showToast("no internet connection", Colors.white, Colors.red);
      return null;
    } on SocketException catch (_) {
      showToast("no internet connection", Colors.white, Colors.red);
      return null;
    }
  }

  Future<bool> register(UserRegister userRegister, BuildContext context) async {
    assert(userRegister != null);
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };
    var body = json.encode({"user": userRegister});

    Uri _uri = Uri.http(url, "/users");
    try {
      final response = await http
          .post(_uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200) {
        showToast(
            "zostałeś zarejestrowany zaloguj się", Colors.white, Colors.green);
        return true;
      } else {
        Map errorInfo = json.decode(response.body)['errors'];

        errorInfo.forEach((key, value) =>
            {showToast('${key}  ${value}', Colors.white, Colors.red)});
        return false;
      }
    } on ConnectionInternetException catch (_) {
      showToast("no internet connection", Colors.white, Colors.red);
      return false;
    } on SocketException catch (_) {
      showToast("no internet connection", Colors.white, Colors.red);
      return false;
    }
  }
}
