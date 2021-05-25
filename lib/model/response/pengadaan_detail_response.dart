import 'package:medis/model/response/pengadaan_response.dart';

import 'add_pesanan_response.dart';

class PengadaanDetailResponse {
  int status;
  String message;
  PengadaanDetailData data;

  PengadaanDetailResponse({this.status, this.message, this.data});

  PengadaanDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null
          ? null
          : PengadaanDetailData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class PengadaanDetailData {
  int count;
  Pengadaan pengadaan;
  List<PengadaanDetail> pengadaanDetail;

  PengadaanDetailData({this.count, this.pengadaan, this.pengadaanDetail});

  PengadaanDetailData.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) this.count = json["count"];
    if (json["pengadaan"] is Map)
      this.pengadaan = json["pengadaan"] == null
          ? null
          : Pengadaan.fromJson(json["pengadaan"]);
    if (json["pengadaan_detail"] is List)
      this.pengadaanDetail = json["pengadaan_detail"] == null
          ? []
          : (json["pengadaan_detail"] as List)
              .map((e) => PengadaanDetail.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["count"] = this.count;
    if (this.pengadaan != null) data["pengadaan"] = this.pengadaan.toJson();
    if (this.pengadaanDetail != null)
      data["pengadaan_detail"] =
          this.pengadaanDetail.map((e) => e.toJson()).toList();
    return data;
  }
}
