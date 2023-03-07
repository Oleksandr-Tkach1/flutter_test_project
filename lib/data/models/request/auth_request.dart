class AuthRequest {
  String? username;
  String? password;


  AuthRequest(
  this.username,
  this.password
      );

  AuthRequest.fromJson(dynamic json) {
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = username;
    map["password"] = password;
    return map;
  }

}