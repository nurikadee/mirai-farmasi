class ObatResponse {
  int status;
  String message;
  DataObat data;

  ObatResponse({this.status, this.message, this.data});

  ObatResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null ? null : DataObat.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class DataObat {
  int count;
  List<Barang> barang;

  DataObat({this.count, this.barang});

  DataObat.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) this.count = json["count"];
    if (json["barang"] is List)
      this.barang = json["barang"] == null
          ? []
          : (json["barang"] as List).map((e) => Barang.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["count"] = this.count;
    if (this.barang != null)
      data["barang"] = this.barang.map((e) => e.toJson()).toList();
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
  String deletedBy;
  String deletedAt;
  String kodeBarang;
  String namaBarang;
  String namaGenerik;
  int idSatuan;
  int idKemasan;
  String tipeBarang;
  String idKelompok;
  int idJenis;
  int idSubJenis;
  int idGolongan;
  int idKlasifikasi;
  String retriksi;
  String deskripsi;
  String keterangan;
  int isiPerKemasan;
  String hargaKemasan;
  String hargaSatuanTerakhir;
  String hargaSatuanTertinggi;
  bool isPpn;
  int totalPpn;
  int diskonPersen;
  int stokMin;
  int stokMax;
  String namaJenis;
  String namaSubJenis;
  String namaSatuan;
  String namaKemasan;
  int jumlahKemasan;

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
      this.namaKemasan,
      this.jumlahKemasan});

  Barang.fromJson(Map<String, dynamic> json) {
    if (json["id_barang"] is int) this.idBarang = json["id_barang"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_by"] is int) this.updatedBy = json["updated_by"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["is_deleted"] is bool) this.isDeleted = json["is_deleted"];
    if (json["deleted_by"] is String) this.deletedBy = json["deleted_by"];
    if (json["deleted_at"] is String) this.deletedAt = json["deleted_at"];
    if (json["kode_barang"] is String) this.kodeBarang = json["kode_barang"];
    if (json["nama_barang"] is String) this.namaBarang = json["nama_barang"];
    if (json["nama_generik"] is String) this.namaGenerik = json["nama_generik"];
    if (json["id_satuan"] is int) this.idSatuan = json["id_satuan"];
    if (json["id_kemasan"] is int) this.idKemasan = json["id_kemasan"];
    if (json["tipe_barang"] is String) this.tipeBarang = json["tipe_barang"];
    if (json["id_kelompok"] is String) this.idKelompok = json["id_kelompok"];
    if (json["id_jenis"] is int) this.idJenis = json["id_jenis"];
    if (json["id_sub_jenis"] is int) this.idSubJenis = json["id_sub_jenis"];
    if (json["id_golongan"] is int) this.idGolongan = json["id_golongan"];
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
    if (json["total_ppn"] is int) this.totalPpn = json["total_ppn"];
    if (json["diskon_persen"] is int) this.diskonPersen = json["diskon_persen"];
    if (json["diskon_persen"] == null) this.diskonPersen = 0;
    if (json["stok_min"] is int) this.stokMin = json["stok_min"];
    if (json["stok_max"] is int) this.stokMax = json["stok_max"];
    if (json["nama_jenis"] is String) this.namaJenis = json["nama_jenis"];
    if (json["nama_sub_jenis"] is String)
      this.namaSubJenis = json["nama_sub_jenis"];
    if (json["nama_satuan"] is String) this.namaSatuan = json["nama_satuan"];
    if (json["nama_kemasan"] is String) this.namaKemasan = json["nama_kemasan"];
    if (json["jumlah_kemasan"] == null) this.jumlahKemasan = 0;
    if (json["jumlah_kemasan"] is int)
      this.jumlahKemasan = json["jumlah_kemasan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data["jumlah_kemasan"] = this.jumlahKemasan;
    return data;
  }
}
