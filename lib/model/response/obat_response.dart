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
  String stokMin;
  String stokMax;
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
    idBarang = json['id_barang'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    deletedBy = json['deleted_by'];
    deletedAt = json['deleted_at'];
    kodeBarang = json['kode_barang'];
    namaBarang = json['nama_barang'];
    namaGenerik = json['nama_generik'];
    idSatuan = json['id_satuan'];
    idKemasan = json['id_kemasan'];
    tipeBarang = json['tipe_barang'];
    idKelompok = json['id_kelompok'];
    idJenis = json['id_jenis'];
    idSubJenis = json['id_sub_jenis'];
    idGolongan = json['id_golongan'];
    idKlasifikasi = json['id_klasifikasi'];
    retriksi = json['retriksi'];
    deskripsi = json['deskripsi'];
    keterangan = json['keterangan'];
    isiPerKemasan = json['isi_per_kemasan'];
    hargaKemasan = json['harga_kemasan'];
    hargaSatuanTerakhir = json['harga_satuan_terakhir'];
    hargaSatuanTertinggi = json['harga_satuan_tertinggi'];
    isPpn = json['is_ppn'];
    totalPpn = json['total_ppn'];
    diskonPersen = json['diskon_persen'];
    stokMin = json['stok_min'];
    stokMax = json['stok_max'];
    namaJenis = json['nama_jenis'];
    namaSubJenis = json['nama_sub_jenis'];
    namaSatuan = json['nama_satuan'];
    namaKemasan = json['nama_kemasan'];
    jumlahKemasan = json['jumlah_kemasan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_barang'] = this.idBarang;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['is_deleted'] = this.isDeleted;
    data['deleted_by'] = this.deletedBy;
    data['deleted_at'] = this.deletedAt;
    data['kode_barang'] = this.kodeBarang;
    data['nama_barang'] = this.namaBarang;
    data['nama_generik'] = this.namaGenerik;
    data['id_satuan'] = this.idSatuan;
    data['id_kemasan'] = this.idKemasan;
    data['tipe_barang'] = this.tipeBarang;
    data['id_kelompok'] = this.idKelompok;
    data['id_jenis'] = this.idJenis;
    data['id_sub_jenis'] = this.idSubJenis;
    data['id_golongan'] = this.idGolongan;
    data['id_klasifikasi'] = this.idKlasifikasi;
    data['retriksi'] = this.retriksi;
    data['deskripsi'] = this.deskripsi;
    data['keterangan'] = this.keterangan;
    data['isi_per_kemasan'] = this.isiPerKemasan;
    data['harga_kemasan'] = this.hargaKemasan;
    data['harga_satuan_terakhir'] = this.hargaSatuanTerakhir;
    data['harga_satuan_tertinggi'] = this.hargaSatuanTertinggi;
    data['is_ppn'] = this.isPpn;
    data['total_ppn'] = this.totalPpn;
    data['diskon_persen'] = this.diskonPersen;
    data['stok_min'] = this.stokMin;
    data['stok_max'] = this.stokMax;
    data['nama_jenis'] = this.namaJenis;
    data['nama_sub_jenis'] = this.namaSubJenis;
    data['nama_satuan'] = this.namaSatuan;
    data['nama_kemasan'] = this.namaKemasan;
    data['jumlah_kemasan'] = this.jumlahKemasan;
    return data;
  }
}
