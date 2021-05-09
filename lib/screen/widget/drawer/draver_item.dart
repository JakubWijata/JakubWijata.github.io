import 'package:flutter/material.dart';

class DraverItem extends StatelessWidget {
  String title;
  VoidCallback onTap;
  DraverItem({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: Colors.white,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            )));
  }
}
