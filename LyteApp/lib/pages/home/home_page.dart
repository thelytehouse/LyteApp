import 'package:LyteApp/pages/home/components/gradient_app_bar.dart';
import 'package:LyteApp/pages/home/components/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String route = 'alert-feed';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("LyteHouse"),
          new HomePageBody(),
        ],
      ),
    );
  }
}
