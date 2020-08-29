import 'package:LyteApp/models/alert.dart';

class AlertResponse {
  final String status;
  final int total;
  final List<Alert> items;
  AlertResponse({this.status, this.total, this.items});
  factory AlertResponse.fromJson(Map<String, dynamic> json) {
    return AlertResponse(
      status: json['status'],
      total: json['total'],
      items: json['items'],
    );
  }
}
