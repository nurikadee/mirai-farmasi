class PenerimaanRequest {
  int createdBy;
  String idPengadaan;
  String noPenerimaan;
  String tglPenerimaan;
  bool isFaktur;
  String noFaktur;
  String tglFaktur;
  String noTt;
  String tglTt;
  int idSupplier;
  String namaSupplier;
  String tipePembelian;
  String catatan;
  int totalSebelumDiskon;
  int totalDiskon;
  int totalSetelahDiskon;
  bool isPpn;
  int totalPpn;
  int total;
  String materai;
  int totalFinal;
  String sumberDana;
  String tglJatuhTempo;
  String keterangan;
  List<BarangPenerimaan> barang;

  PenerimaanRequest(
      {this.createdBy,
      this.idPengadaan,
      this.noPenerimaan,
      this.tglPenerimaan,
      this.isFaktur,
      this.noFaktur,
      this.tglFaktur,
      this.noTt,
      this.tglTt,
      this.idSupplier,
      this.namaSupplier,
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
      this.barang});

  PenerimaanRequest.fromJson(Map<String, dynamic> json) {
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["id_pengadaan"] is String) this.idPengadaan = json["id_pengadaan"];
    if (json["no_penerimaan"] is String)
      this.noPenerimaan = json["no_penerimaan"];
    if (json["tgl_penerimaan"] is String)
      this.tglPenerimaan = json["tgl_penerimaan"];
    if (json["is_faktur"] is bool) this.isFaktur = json["is_faktur"];
    if (json["no_faktur"] is String) this.noFaktur = json["no_faktur"];
    if (json["tgl_faktur"] is String) this.tglFaktur = json["tgl_faktur"];
    if (json["no_tt"] is String) this.noTt = json["no_tt"];
    if (json["tgl_tt"] is String) this.tglTt = json["tgl_tt"];
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["nama_supplier"] is String)
      this.namaSupplier = json["nama_supplier"];
    if (json["tipe_pembelian"] is String)
      this.tipePembelian = json["tipe_pembelian"];
    if (json["catatan"] is String) this.catatan = json["catatan"];
    if (json["total_sebelum_diskon"] is int)
      this.totalSebelumDiskon = json["total_sebelum_diskon"];
    if (json["total_diskon"] is int) this.totalDiskon = json["total_diskon"];
    if (json["total_setelah_diskon"] is int)
      this.totalSetelahDiskon = json["total_setelah_diskon"];
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    if (json["total_ppn"] is int) this.totalPpn = json["total_ppn"];
    if (json["total"] is int) this.total = json["total"];
    if (json["materai"] is String) this.materai = json["materai"];
    if (json["total_final"] is int) this.totalFinal = json["total_final"];
    if (json["sumber_dana"] is String) this.sumberDana = json["sumber_dana"];
    if (json["tgl_jatuh_tempo"] is String)
      this.tglJatuhTempo = json["tgl_jatuh_tempo"];
    if (json["keterangan"] is String) this.keterangan = json["keterangan"];
    if (json["barang"] is List)
      this.barang = json["barang"] == null
          ? []
          : (json["barang"] as List)
              .map((e) => BarangPenerimaan.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["created_by"] = this.createdBy;
    data["id_pengadaan"] = this.idPengadaan;
    data["no_penerimaan"] = this.noPenerimaan;
    data["tgl_penerimaan"] = this.tglPenerimaan;
    data["is_faktur"] = this.isFaktur;
    data["no_faktur"] = this.noFaktur;
    data["tgl_faktur"] = this.tglFaktur;
    data["no_tt"] = this.noTt;
    data["tgl_tt"] = this.tglTt;
    data["id_supplier"] = this.idSupplier;
    data["nama_supplier"] = this.namaSupplier;
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
    if (this.barang != null)
      data["barang"] = this.barang.map((e) => e.toJson()).toList();
    return data;
  }
}

class BarangPenerimaan {
  int idBarang;
  String noBatch;
  String expiredDate;
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
  String hargaBeliSekarang;
  String hargaBeliTertinggi;
  String jumlahDiterima;
  String keterangan;

  BarangPenerimaan(
      {this.idBarang,
      this.noBatch,
      this.expiredDate,
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
      this.hargaBeliSekarang,
      this.hargaBeliTertinggi,
      this.jumlahDiterima,
      this.keterangan});

  BarangPenerimaan.fromJson(Map<String, dynamic> json) {
    if (json["id_barang"] is int) this.idBarang = json["id_barang"];
    if (json["no_batch"] is String) this.noBatch = json["no_batch"];
    if (json["expired_date"] is String) this.expiredDate = json["expired_date"];
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
    if (json["harga_beli_sekarang"] is String)
      this.hargaBeliSekarang = json["harga_beli_sekarang"];
    if (json["harga_beli_tertinggi"] is String)
      this.hargaBeliTertinggi = json["harga_beli_tertinggi"];
    if (json["jumlah_diterima"] is String)
      this.jumlahDiterima = json["jumlah_diterima"];
    if (json["keterangan"] is String) this.keterangan = json["keterangan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_barang"] = this.idBarang;
    data["no_batch"] = this.noBatch;
    data["expired_date"] = this.expiredDate;
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
    data["harga_beli_sekarang"] = this.hargaBeliSekarang;
    data["harga_beli_tertinggi"] = this.hargaBeliTertinggi;
    data["jumlah_diterima"] = this.jumlahDiterima;
    data["keterangan"] = this.keterangan;
    return data;
  }
}
