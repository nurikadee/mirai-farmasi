class PenerimaanResponse {
  int status;
  String message;
  PenerimaanData data;

  PenerimaanResponse({this.status, this.message, this.data});

  PenerimaanResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : PenerimaanData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class PenerimaanData {
  int count;
  List<Penerimaan> penerimaan;

  PenerimaanData({this.count, this.penerimaan});

  PenerimaanData.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) this.count = json["count"];
    if (json["penerimaan"] is List)
      this.penerimaan = json["penerimaan"] == null
          ? []
          : (json["penerimaan"] as List)
              .map((e) => Penerimaan.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["count"] = this.count;
    if (this.penerimaan != null)
      data["penerimaan"] = this.penerimaan.map((e) => e.toJson()).toList();
    return data;
  }
}

class Penerimaan {
  int idPenerimaan;
  bool isActive;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  bool isDeleted;
  dynamic deletedBy;
  dynamic deletedAt;
  int idPengadaan;
  String noPenerimaan;
  String tglPenerimaan;
  bool isFaktur;
  dynamic noFaktur;
  dynamic tglFaktur;
  String noTt;
  String tglTt;
  int idUnitPenerima;
  int idSupplier;
  String tipePembelian;
  String catatan;
  String totalSebelumDiskon;
  String totalDiskon;
  String totalSetelahDiskon;
  bool isPpn;
  String totalPpn;
  String total;
  String materai;
  String totalFinal;
  String sumberDana;
  dynamic tglJatuhTempo;
  dynamic keterangan;
  bool masukStok;
  int status;

  Penerimaan(
      {this.idPenerimaan,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.deletedBy,
      this.deletedAt,
      this.idPengadaan,
      this.noPenerimaan,
      this.tglPenerimaan,
      this.isFaktur,
      this.noFaktur,
      this.tglFaktur,
      this.noTt,
      this.tglTt,
      this.idUnitPenerima,
      this.idSupplier,
      this.tipePembelian,
      this.catatan,
      this.totalSebelumDiskon,
      this.totalDiskon,
      this.totalSetelahDiskon,
      this.isPpn,
      this.totalPpn,
      this.total,
      this.materai,
      this.totalFinal,
      this.sumberDana,
      this.tglJatuhTempo,
      this.keterangan,
      this.masukStok,
      this.status});

  Penerimaan.fromJson(Map<String, dynamic> json) {
    if (json["id_penerimaan"] is int) this.idPenerimaan = json["id_penerimaan"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    this.deletedBy = json["deleted_by"];
    this.deletedAt = json["deleted_at"];
    if (json["id_pengadaan"] is int) this.idPengadaan = json["id_pengadaan"];
    if (json["no_penerimaan"] is String)
      this.noPenerimaan = json["no_penerimaan"];
    if (json["tgl_penerimaan"] is String)
      this.tglPenerimaan = json["tgl_penerimaan"];
    if (json["is_faktur"] is bool) this.isFaktur = json["is_faktur"];
    this.noFaktur = json["no_faktur"];
    this.tglFaktur = json["tgl_faktur"];
    if (json["no_tt"] is String) this.noTt = json["no_tt"];
    if (json["tgl_tt"] is String) this.tglTt = json["tgl_tt"];
    if (json["id_unit_penerima"] is int)
      this.idUnitPenerima = json["id_unit_penerima"];
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["tipe_pembelian"] is String)
      this.tipePembelian = json["tipe_pembelian"];
    if (json["catatan"] is String) this.catatan = json["catatan"];
    if (json["total_sebelum_diskon"] is String)
      this.totalSebelumDiskon = json["total_sebelum_diskon"];
    if (json["total_diskon"] is String) this.totalDiskon = json["total_diskon"];
    if (json["total_setelah_diskon"] is String)
      this.totalSetelahDiskon = json["total_setelah_diskon"];
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    if (json["total_ppn"] is String) this.totalPpn = json["total_ppn"];
    if (json["total"] is String) this.total = json["total"];
    if (json["materai"] is String) this.materai = json["materai"];
    if (json["total_final"] is String) this.totalFinal = json["total_final"];
    if (json["sumber_dana"] is String) this.sumberDana = json["sumber_dana"];
    this.tglJatuhTempo = json["tgl_jatuh_tempo"];
    this.keterangan = json["keterangan"];
    if (json["masuk_stok"] is bool) this.masukStok = json["masuk_stok"];
    if (json["status"] is int) this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_penerimaan"] = this.idPenerimaan;
    data["is_active"] = this.isActive;
    data["created_by"] = this.createdBy;
    data["created_at"] = this.createdAt;
    data["updated_by"] = this.updatedBy;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["deleted_by"] = this.deletedBy;
    data["deleted_at"] = this.deletedAt;
    data["id_pengadaan"] = this.idPengadaan;
    data["no_penerimaan"] = this.noPenerimaan;
    data["tgl_penerimaan"] = this.tglPenerimaan;
    data["is_faktur"] = this.isFaktur;
    data["no_faktur"] = this.noFaktur;
    data["tgl_faktur"] = this.tglFaktur;
    data["no_tt"] = this.noTt;
    data["tgl_tt"] = this.tglTt;
    data["id_unit_penerima"] = this.idUnitPenerima;
    data["id_supplier"] = this.idSupplier;
    data["tipe_pembelian"] = this.tipePembelian;
    data["catatan"] = this.catatan;
    data["total_sebelum_diskon"] = this.totalSebelumDiskon;
    data["total_diskon"] = this.totalDiskon;
    data["total_setelah_diskon"] = this.totalSetelahDiskon;
    data["is_ppn"] = this.isPpn;
    data["total_ppn"] = this.totalPpn;
    data["total"] = this.total;
    data["materai"] = this.materai;
    data["total_final"] = this.totalFinal;
    data["sumber_dana"] = this.sumberDana;
    data["tgl_jatuh_tempo"] = this.tglJatuhTempo;
    data["keterangan"] = this.keterangan;
    data["masuk_stok"] = this.masukStok;
    data["status"] = this.status;
    return data;
  }
}
