import 'package:medis/model/response/penerimaan_response.dart';

class PenerimaanDetailResponse {
  int status;
  String message;
  PenerimaanDetailData data;

  PenerimaanDetailResponse({this.status, this.message, this.data});

  PenerimaanDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null
          ? null
          : PenerimaanDetailData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class PenerimaanDetailData {
  int count;
  Penerimaan penerimaan;
  List<PenerimaanDetail> penerimaanDetail;

  PenerimaanDetailData({this.count, this.penerimaan, this.penerimaanDetail});

  PenerimaanDetailData.fromJson(Map<String, dynamic> json) {
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

class PenerimaanDetail {
  int idPenerimaanDetail;
  bool isActive;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  bool isDeleted;
  dynamic deletedBy;
  dynamic deletedAt;
  int idPenerimaan;
  int idBarang;
  String noBatch;
  String expiredDate;
  String jumlahDiterima;
  String jumlahKemasan;
  int idKemasan;
  String hargaKemasan;
  String isiPerKemasan;
  String jumlahTotal;
  int idSatuan;
  String hargaSatuan;
  String subtotal;
  String diskonPersen;
  String diskonTotal;
  dynamic keterangan;
  String dpp;
  String ppn;
  String dppPpn;
  String hna;
  String diskonHna;
  String ppnHna;
  String hargaBeliSekarang;
  String hargaBeliTertinggi;
  bool isTerima;
  Barang barang;

  PenerimaanDetail(
      {this.idPenerimaanDetail,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.deletedBy,
      this.deletedAt,
      this.idPenerimaan,
      this.idBarang,
      this.noBatch,
      this.expiredDate,
      this.jumlahDiterima,
      this.jumlahKemasan,
      this.idKemasan,
      this.hargaKemasan,
      this.isiPerKemasan,
      this.jumlahTotal,
      this.idSatuan,
      this.hargaSatuan,
      this.subtotal,
      this.diskonPersen,
      this.diskonTotal,
      this.keterangan,
      this.dpp,
      this.ppn,
      this.dppPpn,
      this.hna,
      this.diskonHna,
      this.ppnHna,
      this.hargaBeliSekarang,
      this.hargaBeliTertinggi,
      this.isTerima,
      this.barang});

  PenerimaanDetail.fromJson(Map<String, dynamic> json) {
    if (json["id_penerimaan_detail"] is int)
      this.idPenerimaanDetail = json["id_penerimaan_detail"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    this.deletedBy = json["deleted_by"];
    this.deletedAt = json["deleted_at"];
    if (json["id_penerimaan"] is int) this.idPenerimaan = json["id_penerimaan"];
    if (json["id_barang"] is int) this.idBarang = json["id_barang"];
    if (json["no_batch"] is String) this.noBatch = json["no_batch"];
    if (json["expired_date"] is String) this.expiredDate = json["expired_date"];
    if (json["jumlah_diterima"] is String)
      this.jumlahDiterima = json["jumlah_diterima"];
    if (json["jumlah_kemasan"] is String)
      this.jumlahKemasan = json["jumlah_kemasan"];
    if (json["id_kemasan"] is int) this.idKemasan = json["id_kemasan"];
    if (json["harga_kemasan"] is String)
      this.hargaKemasan = json["harga_kemasan"];
    if (json["isi_per_kemasan"] is String)
      this.isiPerKemasan = json["isi_per_kemasan"];
    if (json["jumlah_total"] is String) this.jumlahTotal = json["jumlah_total"];
    if (json["id_satuan"] is int) this.idSatuan = json["id_satuan"];
    if (json["harga_satuan"] is String) this.hargaSatuan = json["harga_satuan"];
    if (json["subtotal"] is String) this.subtotal = json["subtotal"];
    if (json["diskon_persen"] is String)
      this.diskonPersen = json["diskon_persen"];
    if (json["diskon_total"] is String) this.diskonTotal = json["diskon_total"];
    this.keterangan = json["keterangan"];
    if (json["dpp"] is String) this.dpp = json["dpp"];
    if (json["ppn"] is String) this.ppn = json["ppn"];
    if (json["dpp_ppn"] is String) this.dppPpn = json["dpp_ppn"];
    if (json["hna"] is String) this.hna = json["hna"];
    if (json["diskon_hna"] is String) this.diskonHna = json["diskon_hna"];
    if (json["ppn_hna"] is String) this.ppnHna = json["ppn_hna"];
    if (json["harga_beli_sekarang"] is String)
      this.hargaBeliSekarang = json["harga_beli_sekarang"];
    if (json["harga_beli_tertinggi"] is String)
      this.hargaBeliTertinggi = json["harga_beli_tertinggi"];
    if (json["is_terima"] is bool) this.isTerima = json["is_terima"];
    if (json["barang"] is Map)
      this.barang =
          json["barang"] == null ? null : Barang.fromJson(json["barang"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_penerimaan_detail"] = this.idPenerimaanDetail;
    data["is_active"] = this.isActive;
    data["created_by"] = this.createdBy;
    data["created_at"] = this.createdAt;
    data["updated_by"] = this.updatedBy;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["deleted_by"] = this.deletedBy;
    data["deleted_at"] = this.deletedAt;
    data["id_penerimaan"] = this.idPenerimaan;
    data["id_barang"] = this.idBarang;
    data["no_batch"] = this.noBatch;
    data["expired_date"] = this.expiredDate;
    data["jumlah_diterima"] = this.jumlahDiterima;
    data["jumlah_kemasan"] = this.jumlahKemasan;
    data["id_kemasan"] = this.idKemasan;
    data["harga_kemasan"] = this.hargaKemasan;
    data["isi_per_kemasan"] = this.isiPerKemasan;
    data["jumlah_total"] = this.jumlahTotal;
    data["id_satuan"] = this.idSatuan;
    data["harga_satuan"] = this.hargaSatuan;
    data["subtotal"] = this.subtotal;
    data["diskon_persen"] = this.diskonPersen;
    data["diskon_total"] = this.diskonTotal;
    data["keterangan"] = this.keterangan;
    data["dpp"] = this.dpp;
    data["ppn"] = this.ppn;
    data["dpp_ppn"] = this.dppPpn;
    data["hna"] = this.hna;
    data["diskon_hna"] = this.diskonHna;
    data["ppn_hna"] = this.ppnHna;
    data["harga_beli_sekarang"] = this.hargaBeliSekarang;
    data["harga_beli_tertinggi"] = this.hargaBeliTertinggi;
    data["is_terima"] = this.isTerima;
    if (this.barang != null) data["barang"] = this.barang.toJson();
    return data;
  }
}

class Barang {
  int idBarang;
  bool isActive;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  bool isDeleted;
  dynamic deletedBy;
  dynamic deletedAt;
  String kodeBarang;
  String namaBarang;
  String namaGenerik;
  int idSatuan;
  int idKemasan;
  String tipeBarang;
  String idKelompok;
  int idJenis;
  dynamic idSubJenis;
  dynamic idGolongan;
  int idKlasifikasi;
  String retriksi;
  String deskripsi;
  String keterangan;
  int isiPerKemasan;
  String hargaKemasan;
  String hargaSatuanTerakhir;
  String hargaSatuanTertinggi;
  bool isPpn;
  dynamic totalPpn;
  dynamic diskonPersen;
  dynamic stokMin;
  dynamic stokMax;
  String namaJenis;
  dynamic namaSubJenis;
  String namaSatuan;
  String namaKemasan;

  Barang(
      {this.idBarang,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.deletedBy,
      this.deletedAt,
      this.kodeBarang,
      this.namaBarang,
      this.namaGenerik,
      this.idSatuan,
      this.idKemasan,
      this.tipeBarang,
      this.idKelompok,
      this.idJenis,
      this.idSubJenis,
      this.idGolongan,
      this.idKlasifikasi,
      this.retriksi,
      this.deskripsi,
      this.keterangan,
      this.isiPerKemasan,
      this.hargaKemasan,
      this.hargaSatuanTerakhir,
      this.hargaSatuanTertinggi,
      this.isPpn,
      this.totalPpn,
      this.diskonPersen,
      this.stokMin,
      this.stokMax,
      this.namaJenis,
      this.namaSubJenis,
      this.namaSatuan,
      this.namaKemasan});

  Barang.fromJson(Map<String, dynamic> json) {
    if (json["id_barang"] is int) this.idBarang = json["id_barang"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    this.deletedBy = json["deleted_by"];
    this.deletedAt = json["deleted_at"];
    if (json["kode_barang"] is String) this.kodeBarang = json["kode_barang"];
    if (json["nama_barang"] is String) this.namaBarang = json["nama_barang"];
    if (json["nama_generik"] is String) this.namaGenerik = json["nama_generik"];
    if (json["id_satuan"] is int) this.idSatuan = json["id_satuan"];
    if (json["id_kemasan"] is int) this.idKemasan = json["id_kemasan"];
    if (json["tipe_barang"] is String) this.tipeBarang = json["tipe_barang"];
    if (json["id_kelompok"] is String) this.idKelompok = json["id_kelompok"];
    if (json["id_jenis"] is int) this.idJenis = json["id_jenis"];
    this.idSubJenis = json["id_sub_jenis"];
    this.idGolongan = json["id_golongan"];
    if (json["id_klasifikasi"] is int)
      this.idKlasifikasi = json["id_klasifikasi"];
    if (json["retriksi"] is String) this.retriksi = json["retriksi"];
    if (json["deskripsi"] is String) this.deskripsi = json["deskripsi"];
    if (json["keterangan"] is String) this.keterangan = json["keterangan"];
    if (json["isi_per_kemasan"] is int)
      this.isiPerKemasan = json["isi_per_kemasan"];
    if (json["harga_kemasan"] is String)
      this.hargaKemasan = json["harga_kemasan"];
    if (json["harga_satuan_terakhir"] is String)
      this.hargaSatuanTerakhir = json["harga_satuan_terakhir"];
    if (json["harga_satuan_tertinggi"] is String)
      this.hargaSatuanTertinggi = json["harga_satuan_tertinggi"];
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    this.totalPpn = json["total_ppn"];
    this.diskonPersen = json["diskon_persen"];
    this.stokMin = json["stok_min"];
    this.stokMax = json["stok_max"];
    if (json["nama_jenis"] is String) this.namaJenis = json["nama_jenis"];
    this.namaSubJenis = json["nama_sub_jenis"];
    if (json["nama_satuan"] is String) this.namaSatuan = json["nama_satuan"];
    if (json["nama_kemasan"] is String) this.namaKemasan = json["nama_kemasan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_barang"] = this.idBarang;
    data["is_active"] = this.isActive;
    data["created_by"] = this.createdBy;
    data["created_at"] = this.createdAt;
    data["updated_by"] = this.updatedBy;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["deleted_by"] = this.deletedBy;
    data["deleted_at"] = this.deletedAt;
    data["kode_barang"] = this.kodeBarang;
    data["nama_barang"] = this.namaBarang;
    data["nama_generik"] = this.namaGenerik;
    data["id_satuan"] = this.idSatuan;
    data["id_kemasan"] = this.idKemasan;
    data["tipe_barang"] = this.tipeBarang;
    data["id_kelompok"] = this.idKelompok;
    data["id_jenis"] = this.idJenis;
    data["id_sub_jenis"] = this.idSubJenis;
    data["id_golongan"] = this.idGolongan;
    data["id_klasifikasi"] = this.idKlasifikasi;
    data["retriksi"] = this.retriksi;
    data["deskripsi"] = this.deskripsi;
    data["keterangan"] = this.keterangan;
    data["isi_per_kemasan"] = this.isiPerKemasan;
    data["harga_kemasan"] = this.hargaKemasan;
    data["harga_satuan_terakhir"] = this.hargaSatuanTerakhir;
    data["harga_satuan_tertinggi"] = this.hargaSatuanTertinggi;
    data["is_ppn"] = this.isPpn;
    data["total_ppn"] = this.totalPpn;
    data["diskon_persen"] = this.diskonPersen;
    data["stok_min"] = this.stokMin;
    data["stok_max"] = this.stokMax;
    data["nama_jenis"] = this.namaJenis;
    data["nama_sub_jenis"] = this.namaSubJenis;
    data["nama_satuan"] = this.namaSatuan;
    data["nama_kemasan"] = this.namaKemasan;
    return data;
  }
}
