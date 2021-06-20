import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:www/models/appointment.dart';
import 'package:www/models/pet.dart';
import 'package:www/models/user.dart';

class UserInfo extends ChangeNotifier {
  bool _isLogin = false;
  String _token = "";
  User _user;
  Pet _pet;
  List<Appointment> _userAppointments = [];

  String get token => _token;
  User get user => _user;
  Pet get pet => _pet;
  bool get isLogin => _isLogin;
  bool get appointmentsIsEmpty => _userAppointments.isEmpty;
  List<Appointment> get userAppointments => _userAppointments;
  Appointment get closelyAppointments {
    _userAppointments.sort((a, b) => DateTime.parse(a.appointmentDate)
        .compareTo(DateTime.parse(b.appointmentDate)));
    if (userAppointments.isEmpty) return null;
    return userAppointments[0];
  }

  String get closelyAppointmentsDate {
    Appointment app = closelyAppointments;
    if (closelyAppointments == null) return null;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

    return dateFormat.format(DateTime.parse(app.appointmentDate));
  }

  set userAppointments(List<Appointment> appointments) {
    _userAppointments = appointments;
    notifyListeners();
  }

  void addUserAppointment(Appointment appointment) {
    _userAppointments.add(appointment);
  }

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  set pet(Pet pet) {
    _pet = pet;
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
