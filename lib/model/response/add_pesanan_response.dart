import 'package:medis/model/response/obat_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';

class AddPesananResponse {
  int status;
  String message;
  AddPesanan data;

  AddPesananResponse({this.status, this.message, this.data});

  AddPesananResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : AddPesanan.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class AddPesanan {
  int count;
  Pengadaan pengadaan;
  List<PengadaanDetail> pengadaanDetail;

  AddPesanan({this.count, this.pengadaan, this.pengadaanDetail});

  AddPesanan.fromJson(Map<String, dynamic> json) {
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

class PengadaanDetail {
  int idPengadaanDetail;
  bool isActive;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  bool isDeleted;
  int idPengadaan;
  int idBarang;
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
  String keterangan;
  bool isPpn;
  String hargaBeliSekarang;
  String hargaBeliTertinggi;
  String jumlahDiterima;
  String konHargaJualSatuan;
  String konHargaModalSatuan;
  String konHargaBeliPbf;
  Barang barang;

  PengadaanDetail(
      {this.idPengadaanDetail,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.idPengadaan,
      this.idBarang,
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
      this.isPpn,
      this.hargaBeliSekarang,
      this.hargaBeliTertinggi,
      this.jumlahDiterima,
      this.konHargaJualSatuan,
      this.konHargaModalSatuan,
      this.konHargaBeliPbf,
      this.barang});

  PengadaanDetail.fromJson(Map<String, dynamic> json) {
    if (json["id_pengadaan_detail"] is int)
      this.idPengadaanDetail = json["id_pengadaan_detail"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    if (json["id_pengadaan"] is int) this.idPengadaan = json["id_pengadaan"];
    if (json["id_barang"] is int) this.idBarang = json["id_barang"];
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
    if (json["keterangan"] is String) this.keterangan = json["keterangan"];
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    if (json["harga_beli_sekarang"] is String)
      this.hargaBeliSekarang = json["harga_beli_sekarang"];
    if (json["harga_beli_tertinggi"] is String)
      this.hargaBeliTertinggi = json["harga_beli_tertinggi"];
    if (json["jumlah_diterima"] is String)
      this.jumlahDiterima = json["jumlah_diterima"];
    if (json["kon_harga_jual_satuan"] is String)
      this.konHargaJualSatuan = json["kon_harga_jual_satuan"];
    if (json["kon_harga_modal_satuan"] is String)
      this.konHargaModalSatuan = json["kon_harga_modal_satuan"];
    if (json["kon_harga_beli_pbf"] is String)
      this.konHargaBeliPbf = json["kon_harga_beli_pbf"];
    if (json["barang"] is Map)
      this.barang =
          json["barang"] == null ? null : Barang.fromJson(json["barang"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_pengadaan_detail"] = this.idPengadaanDetail;
    data["is_active"] = this.isActive;
    data["created_by"] = this.createdBy;
    data["created_at"] = this.createdAt;
    data["updated_by"] = this.updatedBy;
    data["updated_at"] = this.updatedAt;
    data["is_deleted"] = this.isDeleted;
    data["id_pengadaan"] = this.idPengadaan;
    data["id_barang"] = this.idBarang;
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
    data["is_ppn"] = this.isPpn;
    data["harga_beli_sekarang"] = this.hargaBeliSekarang;
    data["harga_beli_tertinggi"] = this.hargaBeliTertinggi;
    data["jumlah_diterima"] = this.jumlahDiterima;
    data["kon_harga_jual_satuan"] = this.konHargaJualSatuan;
    data["kon_harga_modal_satuan"] = this.konHargaModalSatuan;
    data["kon_harga_beli_pbf"] = this.konHargaBeliPbf;
    if (this.barang != null) data["barang"] = this.barang.toJson();
    return data;
  }
}
