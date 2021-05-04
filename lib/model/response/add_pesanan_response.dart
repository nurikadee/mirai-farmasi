class AddPesananResponse {
  int status;
  String message;
  PesananData data;

  AddPesananResponse({this.status, this.message, this.data});

  AddPesananResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : PesananData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class PesananData {
  int createdBy;
  int updatedBy;
  String tglSp;
  String noSp;
  int idSupplier;
  String tipePembelian;
  bool isCito;
  String totalSebelumDiskon;
  String totalDiskon;
  String totalSetelahDiskon;
  bool isPpn;
  String totalPpn;
  String total;
  int idApj;
  int idPptk;
  String idUnitPenerima;
  String createdAt;
  String updatedAt;
  bool isDeleted;
  int status;
  String jenis;
  String catatan;
  int idPengadaan;

  PesananData(
      {this.createdBy,
      this.updatedBy,
      this.tglSp,
      this.noSp,
      this.idSupplier,
      this.tipePembelian,
      this.isCito,
      this.totalSebelumDiskon,
      this.totalDiskon,
      this.totalSetelahDiskon,
      this.isPpn,
      this.totalPpn,
      this.total,
      this.idApj,
      this.idPptk,
      this.idUnitPenerima,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.status,
      this.jenis,
      this.catatan,
      this.idPengadaan});

  PesananData.fromJson(Map<String, dynamic> json) {
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["tgl_sp"] is String) this.tglSp = json["tgl_sp"];
    if (json["no_sp"] is String) this.noSp = json["no_sp"];
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["tipe_pembelian"] is String)
      this.tipePembelian = json["tipe_pembelian"];
    if (json["is_cito"] is bool) this.isCito = json["is_cito"];
    if (json["total_sebelum_diskon"] is String)
      this.totalSebelumDiskon = json["total_sebelum_diskon"];
    if (json["total_diskon"] is String) this.totalDiskon = json["total_diskon"];
    if (json["total_setelah_diskon"] is String)
      this.totalSetelahDiskon = json["total_setelah_diskon"];
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    if (json["total_ppn"] is String) this.totalPpn = json["total_ppn"];
    if (json["total"] is String) this.total = json["total"];
    if (json["id_apj"] is int) this.idApj = json["id_apj"];
    if (json["id_pptk"] is int) this.idPptk = json["id_pptk"];
    if (json["id_unit_penerima"] is String)
      this.idUnitPenerima = json["id_unit_penerima"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    if (json["status"] is int) this.status = json["status"];
    if (json["jenis"] is String) this.jenis = json["jenis"];
    if (json["catatan"] is String) this.catatan = json["catatan"];
    if (json["id_pengadaan"] is int) this.idPengadaan = json["id_pengadaan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["created_by"] = this.createdBy;
    data["updated_by"] = this.updatedBy;
    data["tgl_sp"] = this.tglSp;
    data["no_sp"] = this.noSp;
    data["id_supplier"] = this.idSupplier;
    data["tipe_pembelian"] = this.tipePembelian;
    data["is_cito"] = this.isCito;
    data["total_sebelum_diskon"] = this.totalSebelumDiskon;
    data["total_diskon"] = this.totalDiskon;
    data["total_setelah_diskon"] = this.totalSetelahDiskon;
    data["is_ppn"] = this.isPpn;
    data["total_ppn"] = this.totalPpn;
    data["total"] = this.total;
    data["id_apj"] = this.idApj;
    data["id_pptk"] = this.idPptk;
    data["id_unit_penerima"] = this.idUnitPenerima;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["status"] = this.status;
    data["jenis"] = this.jenis;
    data["catatan"] = this.catatan;
    data["id_pengadaan"] = this.idPengadaan;
    return data;
  }
}
