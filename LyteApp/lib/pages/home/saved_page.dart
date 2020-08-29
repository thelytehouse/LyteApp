import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/models/alert_response.dart';
import 'package:LyteApp/pages/home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:LyteApp/Theme.dart' as Theme;
import 'package:LyteApp/models/alert.dart';
import 'package:LyteApp/services/alert_feed_service.dart';

class SavedPageBody extends StatefulWidget {
  @override
  _SavedPageBody createState() => _SavedPageBody();
}

class _SavedPageBody extends State<SavedPageBody> {
  List<Alert> alerts = [];
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
          color: Theme.Colors.alertPageBackground,
          child: FutureBuilder<AlertResponse>(
              future: AlertService().getSavedAlerts(),
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text('Getting your alerts...')
                      ],
                    ),
                  ];
                }
                return ListView(
                  itemExtent: 184.0,
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
