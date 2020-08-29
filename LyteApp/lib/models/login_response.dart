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
