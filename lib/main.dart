import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:www/locator.dart';
import 'package:www/navigation_service.dart';
import 'package:www/services/user_info.dart';
import 'routes/route.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInfo()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: Routes.home,
    );
  }
}
