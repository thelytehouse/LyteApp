import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> login(String username, String password) async {
  String _endpoint = 'http://3.1.209.186:5000/api/v1/UserAPI/Login';
  Map<String, String> _body = {
    'username': username.trim(),
    'password': password.trim()
  };
  Map<String, String> _requestHeaders = {
    "Authorization": "Bearer null",
    "Accept-Encoding": "gzip, deflate",
    "Connection": "keep-alive",
    "Access-Control-Allow-Origin": "*",
    "Accept": "application/json, text/plain, */*",
    "Accept-Language": "en-US,en;q=0.9",
    "Content-Type": "application/json"
  };

  final response = await http.post(
    _endpoint,
    body: json.encode(_body),
    headers: _requestHeaders,
  );
  print('below is response');
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

// Future<String> login(String username, String password) async {
//   String _endpoint = 'http://3.1.209.186:5000/api/v1/UserAPI/Login';
//   HttpClient httpClient = new HttpClient();
//   HttpClientRequest request;
//   HttpClientResponse response;

//   try {
//     request = await httpClient.postUrl(Uri.parse(_endpoint));
//   } catch (e) {
//     print('Creating request connection failed');
//     print(e);
//     print('\n');
//   }

//   dynamic _body = {"username": "dev-g", "password": "demo"};
//   String _encodedBody = json.encode(_body);
//   print('user details');
//   print(username);
//   print(password);
//   print(_encodedBody);

//   try {
//     request.headers.set("Cache-Control", "no-cache");
//     request.headers.set("Content-Type", "application/json");
//     request.headers.set("Accept", "*/*");
//     request.headers.set("Accept-Encoding", "gzip, deflate");
//     request.headers.set("Connection", "keep-alive");
//     // request.headers.set("Access-Control-Allow-Origin", "*");

//     // request.headers.contentType =
//     //     new ContentType("application", "json", charset: "utf-8");
//     // request.headers.set("Authorization", "Bearer null");
//   } catch (e) {
//     print('Failed to setting request headers');
//     print(e);
//     print('\n');
//   }

//   try {
//     // request.add(utf8.encode(json.encode(_body)));
//     // request.write(utf8.encode(json.encode(_body)));
//     request.write(_encodedBody);
//   } catch (e) {
//     print('Failed to set the body to the request');
//     print(e);
//     print('\n');
//   }

//   try {
//     response = await request.close();
//   } catch (e) {
//     print('Failed to get a response from the server');
//     print(e);
//     print('\n');
//   }

//   print('below is response');
//   print(response.statusCode);
//   print(response);
//   String reply = await response.transform(utf8.decoder).join();

//   print('below is reply');
//   print(reply);

//   return reply;
// }

class LoginResponse {
  final String authToken;
  final String message;
  final String status;

  LoginResponse({this.authToken, this.message, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      authToken: json['auth_token'],
      message: json['message'],
      status: json['status'],
    );
  }
}
