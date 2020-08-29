class User {
  final String id;
  final String name;
  final String organisationID;
  final String username;
  String token = "";

  User({this.id, this.name, this.organisationID, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        organisationID: json['organisation_id'],
        username: json['username']);
  }
}
