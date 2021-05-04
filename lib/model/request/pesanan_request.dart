class PesananRequest {
  int createdBy;
  int idJenisBelanja;
  String tglSp;
  String noSp;
  int idSupplier;
  String namaSupplier;
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
  String jenis;
  String catatan;
  List<BarangRequest> barang;

  PesananRequest(
      {this.createdBy,
      this.idJenisBelanja,
      this.tglSp,
      this.noSp,
      this.idSupplier,
      this.namaSupplier,
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
      this.jenis,
      this.catatan,
      this.barang});

  PesananRequest.fromJson(Map<String, dynamic> json) {
    if (json["created_by"] is int) this.createdBy = json["created_by"];
    if (json["id_jenis_belanja"] is int)
      this.idJenisBelanja = json["id_jenis_belanja"];
    if (json["tgl_sp"] is String) this.tglSp = json["tgl_sp"];
    if (json["no_sp"] is String) this.noSp = json["no_sp"];
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["nama_supplier"] is int) this.namaSupplier = json["nama_supplier"];
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
    if (json["jenis"] is String) this.jenis = json["jenis"];
    if (json["catatan"] is String) this.catatan = json["catatan"];
    if (json["barang"] is List)
      this.barang = json["barang"] == null
          ? []
          : (json["barang"] as List)
              .map((e) => BarangRequest.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["created_by"] = this.createdBy;
    data["id_jenis_belanja"] = this.idJenisBelanja;
    data["tgl_sp"] = this.tglSp;
    data["no_sp"] = this.noSp;
    data["id_supplier"] = this.idSupplier;
    data["nama_supplier"] = this.namaSupplier;
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
    data["jenis"] = this.jenis;
    data["catatan"] = this.catatan;
    if (this.barang != null)
      data["barang"] = this.barang.map((e) => e.toJson()).toList();
    return data;
  }
}

class BarangRequest {
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
  bool isPpn;
  String hargaBeliSekarang;
  String hargaBeliTertinggi;
  String jumlahDiterima;

  BarangRequest(
      {this.idBarang,
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
      this.isPpn,
      this.hargaBeliSekarang,
      this.hargaBeliTertinggi,
      this.jumlahDiterima});

  BarangRequest.fromJson(Map<String, dynamic> json) {
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
    if (json["is_ppn"] is bool) this.isPpn = json["is_ppn"];
    if (json["harga_beli_sekarang"] is String)
      this.hargaBeliSekarang = json["harga_beli_sekarang"];
    if (json["harga_beli_tertinggi"] is String)
      this.hargaBeliTertinggi = json["harga_beli_tertinggi"];
    if (json["jumlah_diterima"] is String)
      this.jumlahDiterima = json["jumlah_diterima"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data["is_ppn"] = this.isPpn;
    data["harga_beli_sekarang"] = this.hargaBeliSekarang;
    data["harga_beli_tertinggi"] = this.hargaBeliTertinggi;
    data["jumlah_diterima"] = this.jumlahDiterima;
    return data;
  }
}
