import 'package:flutter/material.dart';

class NavigationItemMobile extends StatelessWidget {
  IconData icon;
  String title;

  NavigationItemMobile({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon ?? Icons.settings),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
