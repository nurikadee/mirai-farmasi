class PenerimaanByIdRequest {
  String idPenerimaan;

  PenerimaanByIdRequest({this.idPenerimaan});

  PenerimaanByIdRequest.fromJson(Map<String, dynamic> json) {
    if (json["id_penerimaan"] is String)
      this.idPenerimaan = json["id_penerimaan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_penerimaan"] = this.idPenerimaan;
    return data;
  }
}
