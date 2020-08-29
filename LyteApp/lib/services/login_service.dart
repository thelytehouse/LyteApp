import 'dart:convert';
import 'package:LyteApp/models/login_response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginResponse> login(String username, String password) async {
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
    if (response.statusCode == 200) {
      print(response.body);
      LoginResponse loginResponse =
          LoginResponse.fromJson(json.decode(response.body));

      return loginResponse;
    } else {
      print(response.body);
      var serverResponse = json.decode(response.body);
      return LoginResponse(
          message: serverResponse['message'], status: "${response.statusCode}");
    }
  }
}
