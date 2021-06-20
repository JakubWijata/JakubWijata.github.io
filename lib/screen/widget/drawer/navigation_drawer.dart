import 'package:flutter/material.dart';
import 'package:www/routes/route.dart';
import 'package:www/screen/widget/drawer/draver_item.dart';
import 'package:www/services/user_info.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Menu"),
          Divider(),
          DraverItem(
            title: 'Cennik',
            onTap: () {
              // Navigator.of(context).pushNamed()
            },
          ),
          DraverItem(
            title: 'Kontakt',
            onTap: () {},
          ),
          DraverItem(
            title: userInfo.isLogin ? userInfo.user.name : 'Moje konto',
            onTap: () => {
              userInfo.isLogin
                  ? Navigator.of(context).pushNamed(Routes.myAccount)
                  : Navigator.of(context).pushNamed(Routes.login)
            },
          ),
          DraverItem(
            title: 'Umów wizyte',
            onTap: () => {
              userInfo.isLogin
                  ? Navigator.of(context).pushNamed(Routes.newAppointment)
                  : Navigator.of(context).pushNamed(Routes.login)
            },
          ),
        ],
      ),
    );
  }
}
