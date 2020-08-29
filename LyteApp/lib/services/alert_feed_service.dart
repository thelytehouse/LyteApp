import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getNewAlerts(String orgID) async {
  orgID = '6c653083-d10e-4298-9e3e-fafb9881cd56';
  String _endpoint = 'http://3.1.209.186:5000/api/v1/AlertAPI/Filter';
  var _body = json.encode({
    "pagination": {"per_page": 12, "page_num": 1},
    "filters": [
      {"key": "dismissed", "operator": "==", "value": false},
      {"key": "organisation_id", "operator": "==", "value": orgID}
    ]
  });

  print('_body');
  print(_body);

  Map<String, String> _requestHeaders = {
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1OTkwMjgzMTEsImlhdCI6MTU5NzgxODcxMSwic3ViIjoiNzVkMzQ4YWUtOThhZC00NTY2LTgxMDgtNDAxMmM0YjY5MDU2In0.ee7vBcv559Nj4EFUOJLiPdM50hocbdV3jIA_ZKWmMd0",
    "Content-Type": "application/json"
  };

  final response = await http.post(
    _endpoint,
    body: _body,
    headers: _requestHeaders,
  );
  print('below is response');
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.body);
  }

  return "failed";
}
