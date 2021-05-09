import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:www/screen/widget/navigation_bar/navigation_item/navigation_item_desktop.dart';
import 'package:www/screen/widget/navigation_bar/navigation_item/navigation_item_mobile.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const NavigationItem({@required this.title, @required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        onTap: onTap,
        child: ScreenTypeLayout(
          tablet: NavigationItemDesktop(title: this.title),
          mobile: NavigationItemMobile(title: this.title, icon: this.icon),
        ),
      ),
    );
  }
}
