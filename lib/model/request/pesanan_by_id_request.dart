class PesananByIdRequest {
  String idPengadaan;

  PesananByIdRequest({this.idPengadaan});

  PesananByIdRequest.fromJson(Map<String, dynamic> json) {
    if (json["id_pengadaan"] is String) this.idPengadaan = json["id_pengadaan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_pengadaan"] = this.idPengadaan;
    return data;
  }
}
