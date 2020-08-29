import 'package:LyteApp/models/user.dart';

class GetUserResponse {
  final String status;
  final User data;

  GetUserResponse({this.status, this.data});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      status: json['status'],
      data: User.fromJson(json['data']),
    );
  }
}
