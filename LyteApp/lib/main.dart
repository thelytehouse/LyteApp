import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/pages/home/home_page.dart';
import 'package:LyteApp/pages/login/login_page.dart';
import 'package:flutter/material.dart';

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
        LoginScreen.route: (context) => LoginScreen(),
        HomePage.route: (context) => HomePage(),
      },
    );
  }
}
