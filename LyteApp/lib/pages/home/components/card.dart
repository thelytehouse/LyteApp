import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/models/alert.dart';
import 'package:LyteApp/services/alert_feed_service.dart';
import 'package:LyteApp/pages/home/components/video_player.dart';
import 'package:flutter/material.dart';
import 'package:LyteApp/Theme.dart' as Theme;
import 'package:share/share.dart';

class AlertCard extends StatelessWidget {
  final Alert alert;

  AlertCard(this.alert);

  @override
  Widget build(BuildContext context) {
    final alertThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 5.0),
      child: new Hero(
        tag: 'alert-icon-${alert.id}',
        child:
            // Image.network(
            //   alert.gifPath,
            //   width: 100,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),
            ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          child: Image.network(
            alert.gifPath,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final alertCard = new Container(
      margin: const EdgeInsets.only(left: 50.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.alertCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(alert.cameraName, style: Theme.TextStyles.alertTitle),
            new Text(alert.timeStamp, style: Theme.TextStyles.alertLocation),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.add_alert,
                    size: 14.0, color: Theme.Colors.alertDistance),
                new Text(alert.priority, style: Theme.TextStyles.alertDistance),
                new Container(width: 24.0),
                new Icon(Icons.person,
                    size: 14.0, color: Theme.Colors.alertDistance),
                new Text(alert.objects, style: Theme.TextStyles.alertDistance),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareButton(),
                _buildSaveButton(),
                _buildDismissButton()
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoApp(alert.clipPath),
          ),
        ),
        child: new Stack(
          children: <Widget>[
            alertCard,
            alertThumbnail,
          ],
        ),
      ),
    );
  }

  _navigateTo(context, String id) {
    Routes.navigateTo(context, '/detail/${alert.id}',
        transition: TransitionType.fadeIn);
  }

  Widget _buildSaveButton() {
    return IconButton(
      color: LytehouseColors.yellow,
      icon: Icon(Icons.save),
      onPressed: () async {
        print("This is the save button ${alert.id}");
      },
    );
  }

  Widget _buildShareButton() {
    return IconButton(
      color: LytehouseColors.yellow,
      icon: Icon(Icons.share),
      onPressed: () async {
        print("This is the share button ${alert.id}");
      },
    );
  }

  Widget _buildDismissButton() {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: IconButton(
          icon: Icon(Icons.delete),
          color: LytehouseColors.yellow,
          onPressed: () async {
            print("This is the dismiss button ${alert.id}");
            var response = await AlertService().dismissAlert(alert.id);
            if (response.toLowerCase() != "fail") {
              AlertService().getNewAlerts();
            }
          },
        ));
  }
}
