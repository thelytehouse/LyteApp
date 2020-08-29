import 'dart:developer';

import 'package:LyteApp/Assets/theme.dart';
import 'package:LyteApp/home/home_page.dart';
import 'package:flutter/material.dart';

import 'Login/login_page.dart';

void main() {
  log('Got in Main');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyte App',
      theme: ThemeData(
        primarySwatch: LytehouseColors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        LoginScreen.route: (context) => LoginScreen(),
        'alert-feed': (context) => HomePage(),
      },
    );
  }
}
