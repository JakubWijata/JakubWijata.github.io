import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:www/screen/home_screen/top_part.dart/top_part_desctop.dart';
import 'package:www/screen/home_screen/top_part.dart/top_part_mobile.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: TopPartMobile(),
      tablet: TopPartMobile(),
      desktop: TopPartDesctop(),
    );
  }
}
