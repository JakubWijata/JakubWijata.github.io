import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:www/internet_connection.dart';
import 'package:www/models/pet.dart';
import 'package:www/services/user_info.dart';
import 'package:www/show_toast.dart';
import 'models/appointment.dart';
import 'models/user.dart';
import 'models/user_login.dart';
import 'models/user_register.dart';

class ApiProvider {
  final String url = "animal-clinic.herokuapp.com";

  Future<User> login(UserLogin userLogin, BuildContext context) async {
    assert(userLogin != null);

    Map<String, String> headers = {
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*",
    };

    var body = json.encode({"user": userLogin});

    Uri _uri = Uri.https(url, "/users//sign_in");

    try {
      final response = await http
          .post(_uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body)['data']);
        try {
          final userinfo = context.read<UserInfo>();
          userinfo.token = response.headers["authorization"];
          userinfo.user = user;

          final succ = await getPet(context);
          if (!succ) return null;
          userinfo.isLogin = true;
          getAppointment(context: context);
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
    } on Exception catch (e) {
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
        User user = User.fromJson(jsonDecode(response.body)['data']);
        try {
          final userinfo = context.read<UserInfo>();
          userinfo.token = response.headers["authorization"];
          userinfo.user = user;
          userinfo.isLogin = true;
        } on Exception catch (_) {
          return null;
        }
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

  Future<bool> registerPet(Pet pet, BuildContext context) async {
    assert(pet != null);
    final userinfo = context.read<UserInfo>();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'authorization': userinfo.token,
    };

    var body = json.encode({"pet": pet});

    Uri _uri = Uri.https(url, "/pets");
    try {
      final response = await http
          .post(_uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        Pet pet = Pet.fromJson(jsonDecode(response.body));
        try {
          final userinfo = context.read<UserInfo>();

          userinfo.pet = pet;

          return true;
        } on Exception catch (_) {
          return false;
        }
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

  Future<List<String>> getSlots(
      {DateTime dateTime, @required BuildContext context}) async {
    assert(dateTime != null, "dateTime can not be null");

    String time = dateTime.toString().split(' ')[0];
    Uri _uri = Uri.http(url, "/slots/index",
        {'appointment_date': '$time', 'doctor_id': '35', 'treatment_id': '1'});

    try {
      final response = await http.get(_uri).timeout(const Duration(seconds: 10),
          onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200) {
        List slots = jsonDecode(response.body)['free_slots'];
        List<String> res = List();
        if (slots == null) return res;
        slots.forEach((element) {
          res.add(element);
        });
        return res;
      } else {
        showToast("Cant load slots", Colors.white, Colors.red);
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

  Future<Appointment> createAppointment(
      {Appointment appointment, @required BuildContext context}) async {
    assert(appointment != null, "appointment can not be null");

    final userinfo = context.read<UserInfo>();
    String token = userinfo.token;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': token,
    };
    appointment.doctorId = 35;
    appointment.treatmentId = 1;

    var body = json.encode({"appointment": appointment});

    Uri _uri = Uri.https(url, "/appointments");

    try {
      final response = await http
          .post(_uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("Brak polaczenia z internetem");
      });

      if (response.statusCode == 200) {
        Appointment appointment =
            Appointment.fromJson(jsonDecode(response.body)['data']);
        userinfo.addUserAppointment(appointment);
        return appointment;
      } else {
        showToast("Nie udało się utworzyć wizyty spróbuj ponownie",
            Colors.white, Colors.red);
        return null;
      }
    } on ConnectionInternetException catch (_) {
      showToast("Brak polaczenia z internetem", Colors.white, Colors.red);
      return null;
    } on SocketException catch (_) {
      showToast("Brak polaczenia z internetem", Colors.white, Colors.red);
      return null;
    }
  }

  Future<bool> getAppointment({@required BuildContext context}) async {
    final userinfo = context.read<UserInfo>();
    String token = userinfo.token;

    Map<String, String> headers = {
      'Authorization': token,
    };
    Uri _uri = Uri.https(url, "/appointments");

    try {
      final response = await http
          .get(_uri, headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("Brak połączenia z internetem");
      });

      if (response.statusCode == 200) {
        List<dynamic> pageAppointment = jsonDecode(response.body)["data"];
        List<Appointment> appointments = [];
        pageAppointment.forEach((element) {
          appointments.add(Appointment.fromJson(element));
        });
        userinfo.userAppointments = appointments;
        return true;
      } else {
        showToast("nie mogę załadować wizyt", Colors.white, Colors.red);
        return false;
      }
    } on ConnectionInternetException catch (_) {
      showToast("Brak połączenia z internetem", Colors.white, Colors.red);
      return false;
    } on SocketException catch (_) {
      showToast("Brak połączenia z internetem", Colors.white, Colors.red);
      return false;
    }
  }

  Future<bool> getPet(BuildContext context) async {
    final userinfo = context.read<UserInfo>();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'authorization': userinfo.token,
    };

    Uri _uri = Uri.https(url, "/pets");
    try {
      final response = await http
          .get(_uri, headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ConnectionInternetException("no internet connection");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        Pet pet = Pet.fromJson(jsonDecode(response.body)[0]);
        try {
          userinfo.pet = pet;

          return true;
        } on Exception catch (_) {
          return false;
        }
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
