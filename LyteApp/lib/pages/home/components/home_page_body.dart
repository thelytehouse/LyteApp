import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/models/alert_response.dart';
import 'package:LyteApp/pages/home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:LyteApp/Theme.dart' as Theme;
import 'package:LyteApp/models/alert.dart';
import 'package:LyteApp/services/alert_feed_service.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBody createState() => _HomePageBody();
}

class _HomePageBody extends State<HomePageBody> {
  List<Alert> alerts = [];
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
          color: Theme.Colors.alertPageBackground,
          child: FutureBuilder<AlertResponse>(
              future: AlertService().getNewAlerts(),
              builder: (BuildContext context,
                  AsyncSnapshot<AlertResponse> snapshot) {
                List<Widget> children = [];
                if (snapshot.hasData) {
                  List<Alert> alerts = snapshot.data.items;
                  for (var i = 0; i < alerts.length; i++) {
                    children.add(AlertCard(
                        alert: alerts[i],
                        successfulDismissCallback: dismissCallback));
                  }
                } else {
                  children = <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Getting your alerts...'),
                    )
                  ];
                }
                return ListView(
                  itemExtent: 170.0,
                  children: children,
                );
              })),
    );
  }

  dismissCallback() {
    _showToast(this.context, "Alert successfully dismissed");
    setState(() {});
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: LytehouseColors.purple,
      ),
    );
  }
}
