import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:www/routes/route.dart';
import 'package:www/services/user_info.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();

    return Scaffold(
      body: Column(
        children: [
          Text(userInfo.isLogin ? "zalogowany" : "niezalogowany"),
          ColoredBox(
            color: Colors.red,
            child: SizedBox(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                onPressed: () => {userInfo.isLogin = !userInfo.isLogin},
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
