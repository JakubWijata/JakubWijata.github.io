import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/screen/widget/navigation_bar/navigation_item/navigation_item.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(255, 255, 255, 0.95),
        height: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(Img.logo),
              ),
              Flexible(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavigationItem(
                    title: 'Cennik',
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(title: 'Kontakt', onTap: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(title: 'Moje konto', onTap: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: NavigationItem(
                                title: 'Umów wizyte', onTap: () {}),
                          )))
                ],
              ))
            ],
          ),
        ));
  }
}
