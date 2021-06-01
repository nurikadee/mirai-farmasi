import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';

class AddPenerimaanResponse {
  int status;
  String message;
  AddPenerimaanData data;

  AddPenerimaanResponse({this.status, this.message, this.data});

  AddPenerimaanResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null
          ? null
          : AddPenerimaanData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class AddPenerimaanData {
  int count;
  Penerimaan penerimaan;
  List<PenerimaanDetail> penerimaanDetail;

  AddPenerimaanData({this.count, this.penerimaan, this.penerimaanDetail});

  AddPenerimaanData.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) this.count = json["count"];
    if (json["penerimaan"] is Map)
      this.penerimaan = json["penerimaan"] == null
          ? null
          : Penerimaan.fromJson(json["penerimaan"]);
    if (json["penerimaan_detail"] is List)
      this.penerimaanDetail = json["penerimaan_detail"] == null
          ? []
          : (json["penerimaan_detail"] as List)
              .map((e) => PenerimaanDetail.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["count"] = this.count;
    if (this.penerimaan != null) data["penerimaan"] = this.penerimaan.toJson();
    if (this.penerimaanDetail != null)
      data["penerimaan_detail"] =
          this.penerimaanDetail.map((e) => e.toJson()).toList();
    return data;
  }
}
