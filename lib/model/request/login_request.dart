class LoginRequest {
  String username;
  String password;

  LoginRequest({this.username, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    if (json["username"] is String) this.username = json["username"];
    if (json["password"] is String) this.password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["username"] = this.username;
    data["password"] = this.password;
    return data;
  }
}
