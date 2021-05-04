class SaveTokenRequest {
  String username;
  String deviceId;
  String token;

  SaveTokenRequest({this.username, this.deviceId, this.token});

  SaveTokenRequest.fromJson(Map<String, dynamic> json) {
    if (json["username"] is String) this.username = json["username"];
    if (json["device_id"] is String) this.deviceId = json["device_id"];
    if (json["token"] is String) this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["username"] = this.username;
    data["device_id"] = this.deviceId;
    data["token"] = this.token;
    return data;
  }
}
