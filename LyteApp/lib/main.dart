import 'dart:isolate';
import 'dart:ui';

import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/pages/home/home_page.dart';
import 'package:LyteApp/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String countKey = 'count';
const String userNameKey = 'userName';
const String orgIdKey = 'orgId';

/// The name associated with the UI isolate's [SendPort].
const String isolateName = 'isolate';

/// A port used to communicate from a background isolate to the UI isolate.
final ReceivePort port = ReceivePort();

/// Global [SharedPreferences] object.
SharedPreferences prefs;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(countKey)) {
    await prefs.setInt(countKey, 0);
  }
  if (!prefs.containsKey(userNameKey)) {
    await prefs.setString(userNameKey, '');
  }
  if (!prefs.containsKey(orgIdKey)) {
    await prefs.setString(orgIdKey, '');
  }
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
