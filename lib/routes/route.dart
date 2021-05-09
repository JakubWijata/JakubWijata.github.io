import 'package:flutter/material.dart';
import 'package:www/screen/home_screen/home_screen.dart';
import 'package:www/screen/second/second.dart';

class Routes {
  static const first = '/Home';
  static const second = '/second';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.first:
      return _getPageRoute(HomeScreen(), settings);
    case Routes.second:
      return _getPageRoute(Second(), settings);
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
