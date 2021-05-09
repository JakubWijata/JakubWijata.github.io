import 'package:flutter/material.dart';
import 'package:www/img.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(255, 255, 255, 0.95),
        height: 30,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 20,
                icon: Icon(Icons.menu),
                onPressed: Scaffold.of(context).openDrawer,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  Img.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ));
  }
}
