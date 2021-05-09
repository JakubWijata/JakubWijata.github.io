import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:www/screen/home_screen/bot_part/bot_part_desctop.dart';
import 'package:www/screen/home_screen/bot_part/bot_part_mobile.dart';

class BotPart extends StatelessWidget {
  const BotPart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: BotPartMobile(),
      tablet: BotPartDesctop(),
      desktop: BotPartDesctop(),
    );
  }
}
