import 'package:flutter/material.dart';
import 'package:www/screen/home_screen/home_screen.dart';
import 'package:www/screen/login_screen/login_screen.dart';
import 'package:www/screen/my_account._screen/my_account_screen.dart';
import 'package:www/screen/pet_details/pet_detail_list.dart';
import 'package:www/screen/pet_details/pet_details_screen.dart';
import 'package:www/screen/register_pet_screen.dart/register_pet_screen..dart';
import 'package:www/screen/register_screen/register_screen.dart';

class Routes {
  static const home = '/Home';
  static const login = '/Login';
  static const register = '/Register';
  static const petForm = '/PetForm';

  static const pet = '/Pet';
  static const myAccount = '/MyAccount';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      //TODO replece login scren to gomescree
      return _getPageRoute(HomeScreen(), settings);
    case Routes.login:
      return _getPageRoute(LoginScreen(), settings);
    case Routes.register:
      return _getPageRoute(RegisterScreen(), settings);
    case Routes.myAccount:
      return _getPageRoute(MyAccountScreen(), settings);
    case Routes.petForm:
      return _getPageRoute(RegisterPetScreen(), settings);
    case Routes.pet:
      return _getPageRoute(PetDetailsScreen(), settings);
    default:
      return _getPageRoute(HomeScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
