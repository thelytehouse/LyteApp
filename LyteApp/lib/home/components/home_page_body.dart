import 'package:LyteApp/home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:LyteApp/Theme.dart' as Theme;
import 'package:LyteApp/models/alert.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Theme.Colors.alertPageBackground,
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: returnCard().length,
          itemBuilder: (_, index) => new AlertCard(returnCard()[index]),
        ),
      ),
    );
  }

  returnCard() {
    List<Alert> alerts = List<Alert>();
    Alert alert1 = new Alert(
        cameraName: 'Testname1',
        clipPath:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fcrime&psig=AOvVaw1I2lwdbL_6FksnWCZpDAtI&ust=1598790984196000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLig_dW2wOsCFQAAAAAdAAAAABAD',
        gifPath:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftenor.com%2Fsearch%2Fanime-boy-gifs&psig=AOvVaw1lrxte-OCccjLCuazSrgkQ&ust=1598791022064000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIC6iui2wOsCFQAAAAAdAAAAABAS',
        id: '1243445565112',
        objects: 'person',
        priority: 'high',
        timeStamp: '21/01/2020 14:00');
    alerts.add(alert1);
    Alert alert2 = new Alert(
        cameraName: 'Testname2',
        clipPath:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fcrime&psig=AOvVaw1I2lwdbL_6FksnWCZpDAtI&ust=1598790984196000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLig_dW2wOsCFQAAAAAdAAAAABAD',
        gifPath:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftenor.com%2Fsearch%2Fanime-boy-gifs&psig=AOvVaw1lrxte-OCccjLCuazSrgkQ&ust=1598791022064000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIC6iui2wOsCFQAAAAAdAAAAABAS',
        id: '1243445565',
        objects: 'person',
        priority: 'medium',
        timeStamp: '22/01/2020 16:00');
    alerts.add(alert2);
    return alerts;
  }
}
