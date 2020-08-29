import 'dart:convert';

import 'package:LyteApp/models/get_user_response.dart';
import 'package:LyteApp/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static final UserService _userService = UserService._internal();
  static User _user;

  factory UserService() {
    return _userService;
  }

  UserService._internal();

  Future<GetUserResponse> getUserDetails(String authToken) async {
    String _endpoint = 'http://3.1.209.186:5000/api/v1/UserAPI/GetUser';
    Map<String, String> _requestHeaders = {
      "Authorization": "Bearer $authToken",
      "Accept-Encoding": "gzip, deflate",
      "Connection": "keep-alive",
      "Access-Control-Allow-Origin": "*",
      "Accept": "application/json, text/plain, */*",
      "Accept-Language": "en-US,en;q=0.9",
      "Content-Type": "application/json"
    };

    final response = await http.post(
      _endpoint,
      body: json.encode({}),
      headers: _requestHeaders,
    );

    if (response.statusCode == 200) {
      print(response.body);
      GetUserResponse getUserResponse =
          GetUserResponse.fromJson(json.decode(response.body));
      setUser(getUserResponse.data);

      return getUserResponse;
    } else {
      print(response.body);
      return GetUserResponse(status: "${response.statusCode}");
    }
  }

  User get getUser => _user;

  setUser(User user) {
    _user = user;
  }

  setUserToken(String token) {
    _user.token = token;
  }
}
