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
    Future<String> v = returnCard();
    return new Flexible(
      child: new Container(
        color: Theme.Colors.alertPageBackground,
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: alerts.length,
          itemBuilder: (_, index) => new AlertCard(alerts[index]),
        ),
      ),
    );
  }

  Future<String> returnCard() async {
    AlertResponse jsonObject = await getNewAlerts('');
    setState(() {
      alerts = jsonObject.items;
    });
    return '';
  }
}
