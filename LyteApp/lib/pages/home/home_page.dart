import 'package:LyteApp/pages/home/components/gradient_app_bar.dart';
import 'package:LyteApp/pages/home/components/home_page_body.dart';
import 'package:LyteApp/pages/home/saved_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String route = 'alert-feed';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.add_alert)),
              Tab(icon: Icon(Icons.save)),
            ],
          ),
          title: GradientAppBar("LyteHouse"),
        ),
        body: TabBarView(
          children: [
            new HomePageBody(),
            new SavedPageBody(),
          ],
        ),
      ),
    );

    //   body: new Column(
    //     children: <Widget>[
    //       new GradientAppBar("LyteHouse"),
    //       new HomePageBody(),
    //     ],
    //   ),
    // );
  }
}
