import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar_mobile.dart';

import 'navigation_bar_desktop.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarDesktop(),
    );
  }
}
