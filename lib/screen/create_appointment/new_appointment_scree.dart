import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:www/screen/create_appointment/card_appointment.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';
import 'package:www/services/user_info.dart';
import 'package:provider/provider.dart';

class NewAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();

    return Scaffold(
        drawer: NavigationDrawer(),
        body: Stack(children: [
          ListView(
            padding: EdgeInsets.all(50),
            children: [
              SizedBox(height: 100),
              Row(
                children: [
                  Spacer(),
                  CardAppointment(),
                  Spacer(),
                ],
              )
            ],
          ),
          NavigationBar(),
        ]));
  }
}
