class PengadaanResponse {
  int status;
  String message;
  PengadaanData data;

  PengadaanResponse({this.status, this.message, this.data});

  PengadaanResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : PengadaanData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class PengadaanData {
  int count;
  List<Pengadaan> pengadaan;

  PengadaanData({this.count, this.pengadaan});

  PengadaanData.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) this.count = json["count"];
    if (json["pengadaan"] is List)
      this.pengadaan = json["pengadaan"] == null
          ? []
          : (json["pengadaan"] as List)
              .map((e) => Pengadaan.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["count"] = this.count;
    if (this.pengadaan != null)
      data["pengadaan"] = this.pengadaan.map((e) => e.toJson()).toList();
    return data;
  }
}

class Pengadaan {
  int idPengadaan;
  bool isActive;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  bool isDeleted;
  String deletedBy;
  String deletedAt;
  int idJenisBelanja;
  int idUnitPenerima;
  String tglSp;
  String noSp;
  int idSupplier;
  String namaSupplier;
  String tipePembelian;
  String catatan;
  bool isCito;
  bool isKonsinyasi;
  String totalSebelumDiskon;
  String totalDiskon;
  String totalSetelahDiskon;
  bool isPpn;
  String totalPpn;
  String total;
  int idApj;
  int idPptk;
  String konPeriodeAwal;
  String konPeriodeAkhir;
  int konUnitPelayanan;
  String konCaraBayar;
  String konPenjamin;
  int status;
  bool isTtd;
  String statusBarang;
  String lrPerihal;
  String lrBulan;
  String jenis;

  Pengadaan(
      {this.idPengadaan,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.deletedBy,
      this.deletedAt,
      this.idJenisBelanja,
      this.idUnitPenerima,
      this.tglSp,
      this.noSp,
      this.idSupplier,
      this.namaSupplier,
      this.tipePembelian,
      this.catatan,
      this.isCito,
      this.isKonsinyasi,
      this.totalSebelumDiskon,
      this.totalDiskon,
      this.totalSetelahDiskon,
      this.isPpn,
      this.totalPpn,
      this.total,
      this.idApj,
      this.idPptk,
      this.konPeriodeAwal,
      this.konPeriodeAkhir,
      this.konUnitPelayanan,
      this.konCaraBayar,
      this.konPenjamin,
      this.status,
      this.isTtd,
      this.statusBarang,
      this.lrPerihal,
      this.lrBulan,
      this.jenis});

  Pengadaan.fromJson(Map<String, dynamic> json) {
    if (json["id_pengadaan"] is int) this.idPengadaan = json["id_pengadaan"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    if (json["deleted_by"] is String) this.deletedBy = json["deleted_by"];
    if (json["deleted_at"] is String) this.deletedAt = json["deleted_at"];
    if (json["id_jenis_belanja"] is int)
      this.idJenisBelanja = json["id_jenis_belanja"];
    if (json["id_unit_penerima"] is int)
      this.idUnitPenerima = json["id_unit_penerima"];
    if (json["tgl_sp"] is String) this.tglSp = json["tgl_sp"];
    if (json["no_sp"] is String) this.noSp = json["no_sp"];
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["nama_supplier"] is String)
      this.namaSupplier = json["nama_supplier"];
    if (json["tipe_pembelian"] is String)
      this.tipePembelian = json["tipe_pembelian"];
    if (json["catatan"] is String) this.catatan = json["catatan"];
    if (json["is_cito"] is bool) this.isCito = json["is_cito"];
    if (json["is_konsinyasi"] is bool)
      this.isKonsinyasi = json["is_konsinyasi"];
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
    if (json["kon_periode_awal"] is String)
      this.konPeriodeAwal = json["kon_periode_awal"];
    if (json["kon_periode_akhir"] is String)
      this.konPeriodeAkhir = json["kon_periode_akhir"];
    if (json["kon_unit_pelayanan"] is int)
      this.konUnitPelayanan = json["kon_unit_pelayanan"];
    if (json["kon_cara_bayar"] is String)
      this.konCaraBayar = json["kon_cara_bayar"];
    if (json["kon_penjamin"] is String) this.konPenjamin = json["kon_penjamin"];
    if (json["status"] is int) this.status = json["status"];
    if (json["is_ttd"] is bool) this.isTtd = json["is_ttd"];
    if (json["status_barang"] is String)
      this.statusBarang = json["status_barang"];
    if (json["lr_perihal"] is String) this.lrPerihal = json["lr_perihal"];
    if (json["lr_bulan"] is String) this.lrBulan = json["lr_bulan"];
    if (json["jenis"] is String) this.jenis = json["jenis"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id_pengadaan"] = this.idPengadaan;
    data["is_active"] = this.isActive;
    data["created_by"] = this.createdBy;
    data["created_at"] = this.createdAt;
    data["updated_by"] = this.updatedBy;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["deleted_by"] = this.deletedBy;
    data["deleted_at"] = this.deletedAt;
    data["id_jenis_belanja"] = this.idJenisBelanja;
    data["id_unit_penerima"] = this.idUnitPenerima;
    data["tgl_sp"] = this.tglSp;
    data["no_sp"] = this.noSp;
    data["id_supplier"] = this.idSupplier;
    data["nama_supplier"] = this.namaSupplier;
    data["tipe_pembelian"] = this.tipePembelian;
    data["catatan"] = this.catatan;
    data["is_cito"] = this.isCito;
    data["is_konsinyasi"] = this.isKonsinyasi;
    data["total_sebelum_diskon"] = this.totalSebelumDiskon;
    data["total_diskon"] = this.totalDiskon;
    data["total_setelah_diskon"] = this.totalSetelahDiskon;
    data["is_ppn"] = this.isPpn;
    data["total_ppn"] = this.totalPpn;
    data["total"] = this.total;
    data["id_apj"] = this.idApj;
    data["id_pptk"] = this.idPptk;
    data["kon_periode_awal"] = this.konPeriodeAwal;
    data["kon_periode_akhir"] = this.konPeriodeAkhir;
    data["kon_unit_pelayanan"] = this.konUnitPelayanan;
    data["kon_cara_bayar"] = this.konCaraBayar;
    data["kon_penjamin"] = this.konPenjamin;
    data["status"] = this.status;
    data["is_ttd"] = this.isTtd;
    data["status_barang"] = this.statusBarang;
    data["lr_perihal"] = this.lrPerihal;
    data["lr_bulan"] = this.lrBulan;
    data["jenis"] = this.jenis;
    return data;
  }
}
