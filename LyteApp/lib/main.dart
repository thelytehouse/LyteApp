import 'package:LyteApp/Assets/theme.dart';
import 'package:flutter/material.dart';

import 'Login/login_page.dart';

void main() {
  runApp(LyteApp());
}

class LyteApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyte App',
      theme: ThemeData(
        primarySwatch: LytehouseColors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: LytehouseColors.purple,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        'alert-feed': (context) => LoginScreen(),
      },
    );
  }
}
