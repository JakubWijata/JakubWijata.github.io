import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/routes/route.dart';
import 'package:www/screen/my_account._screen/list_widget.dart';
import 'package:www/screen/pet_details/pet_detail_list.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';
import 'package:www/services/user_info.dart';
import 'package:provider/provider.dart';

class PetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    if (!userInfo.isLogin) {
      Navigator.of(context).pushNamed(Routes.home);
    }
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
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Spacer(flex: 3),
                Flexible(flex: 2, child: PetDetails()),
              ],
            )
          ],
        ),
        NavigationBar(),
      ]),
    );
  }
}
