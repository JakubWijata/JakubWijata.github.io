import 'package:flutter/material.dart';
import 'package:www/routes/route.dart';
import 'package:www/screen/widget/drawer/draver_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title: 'Moje konto',
            onTap: () => Navigator.of(context).pushNamed(Routes.myAccount),
          ),
          DraverItem(
            title: 'Umów wizyte',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
