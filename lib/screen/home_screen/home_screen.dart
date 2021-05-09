import 'package:flutter/material.dart';
import 'package:www/screen/home_screen/bot_part/bot_part.dart';
import 'package:www/screen/home_screen/top_part.dart/top_part.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        body: Stack(children: [
          ListView(
            children: [
              TopPart(),
              BotPart(),
            ],
          ),
          NavigationBar(),
        ]));
  }
}
