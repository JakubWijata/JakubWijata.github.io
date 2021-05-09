import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:www/routes/route.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.red,
        child: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.first),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
