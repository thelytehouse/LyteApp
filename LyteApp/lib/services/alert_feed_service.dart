import 'dart:convert';
import 'package:LyteApp/models/alert_response.dart';
import 'package:LyteApp/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AlertService {
  Future<AlertResponse> getNewAlerts() async {
    String orgID = '6c653083-d10e-4298-9e3e-fafb9881cd56';
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1OTkwMjgzMTEsImlhdCI6MTU5NzgxODcxMSwic3ViIjoiNzVkMzQ4YWUtOThhZC00NTY2LTgxMDgtNDAxMmM0YjY5MDU2In0.ee7vBcv559Nj4EFUOJLiPdM50hocbdV3jIA_ZKWmMd0";
    // String orgID = UserService().getUser.organisationID;
    // String token = UserService().getUser.token;
    String _endpoint = 'http://3.1.209.186:5000/api/v1/AlertAPI/Filter';
    var _body = json.encode({
      "pagination": {"per_page": 12, "page_num": 1},
      "filters": [
        {"key": "dismissed", "operator": "==", "value": false},
        {"key": "organisation_id", "operator": "==", "value": orgID}
      ]
    });

    Map<String, String> _requestHeaders = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    final response = await http.post(
      _endpoint,
      body: _body,
      headers: _requestHeaders,
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AlertResponse.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
    }
    return new AlertResponse();
  }

// {"ids":["85ff71f8-7007-4352-ac25-978f1183a8f2"],"user_id":"3acc68e5-90e2-4ec2-a74f-a7ba30c4ece3","dismiss_timestamp":"2020-08-29 18:06:58"}
  Future<String> dismissAlert(String alertID) async {
    String userID = UserService().getUser.id;
    String token = UserService().getUser.token;
    String _endpoint = 'http://3.1.209.186:5000/api/v1/AlertAPI/Dismiss';
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:MM:ss').format(now);
    Map<String, dynamic> _body = {
      'user_id': userID,
      'dismiss_timestamp': formattedDate,
      'ids': [alertID]
    };

    Map<String, String> _requestHeaders = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    final response = await http.post(
      _endpoint,
      body: _body,
      headers: _requestHeaders,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
    }

    return "Fail";
  }
}
