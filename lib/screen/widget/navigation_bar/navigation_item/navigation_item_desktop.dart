import 'package:flutter/material.dart';

class NavigationItemDesktop extends StatelessWidget {
  final String title;
  NavigationItemDesktop({this.title});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
