import 'dart:ui';

import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/main.dart';
import 'package:LyteApp/models/alert_response.dart';
import 'package:LyteApp/pages/home/components/card.dart';
import 'package:LyteApp/services/user_service.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:LyteApp/Theme.dart' as Theme;
import 'package:LyteApp/models/alert.dart';
import 'package:LyteApp/services/alert_feed_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:isolate';
import 'dart:math';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBody createState() => _HomePageBody();
}

class _HomePageBody extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();

    // Register for events from the background isolate. These messages will
    // always coincide with an alarm firing.
    port.listen((_) async => await _incrementCounter());
    callAlarmManager();
  }

  Future<void> _incrementCounter() async {
    // Ensure we've loaded the updated count from the background isolate.
    await prefs.reload();
    setState(() {});
  }

  // The background
  static SendPort uiSendPort;

  // The callback for our alarm
  static Future<void> callback() async {
    print('Alarm fired!');

    // Get the previous cached count and increment it.
    final prefs = await SharedPreferences.getInstance();
    int currentCount = prefs.getInt(countKey);
    String userName = prefs.getString(userNameKey);
    String orgId = prefs.getString(orgIdKey);
    print(userName);
    print(orgId);

    var response = await AlertService()
        .getNewAlerts(userToken: userName, userOrganisation: orgId);

    if (response.total != currentCount) {
      await prefs.setInt(countKey, response.total);
    }

    // This will be null if we're running in the background.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }

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
                    children.add(
                      AlertCard(
                        alert: alerts[i],
                        successfulDismissCallback: dismissCallback,
                        successfulSaveCallback: saveCallback,
                      ),
                    );
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

  callAlarmManager() async {
    await AndroidAlarmManager.periodic(
        Duration(seconds: 30), Random().nextInt(pow(2, 31)), callback);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userNameKey, UserService().getUser.token);
    await prefs.setString(orgIdKey, UserService().getUser.organisationID);
    var response = await AlertService().getNewAlerts();
    await prefs.setInt(countKey, response.total);
  }

  dismissCallback() {
    _showToast(this.context, "Alert successfully dismissed");
    setState(() {});
  }

  saveCallback() {
    _showToast(this.context, "Alert successfully saved");
    setState(() {});
  }

  _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: LytehouseColors.purple,
      ),
    );
  }
}
