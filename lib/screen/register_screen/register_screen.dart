import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:www/img.dart';
import 'package:www/routes/route.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/login_form.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';
import 'package:www/screen/widget/register_from.dart';
import 'package:www/services/user_info.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();

    return Scaffold(
        drawer: NavigationDrawer(),
        body: Stack(children: [
          ListView(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 10 / 16,
                      child: Image(
                        image: AssetImage(Img.loginCat),
                        fit: BoxFit.fill, // use this
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: RegisterForm(),
                    ),
                    flex: 4,
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
          NavigationBar(),
        ]));
  }
}
