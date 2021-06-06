import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/screen/my_account._screen/list_widget.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          child: Image(
            image: AssetImage(Img.doctorDog),
            fit: BoxFit.fill,
          ),
        ),
        ListView(
          padding: EdgeInsets.all(100),
          children: [
            SizedBox(height: 100),
            Row(
              children: [
                Spacer(flex: 3),
                Flexible(flex: 2, child: ListWidget()),
              ],
            )
          ],
        ),
        NavigationBar(),
      ]),
    );
  }
}
