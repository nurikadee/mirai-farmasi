class PesananRequest {
  int createdBy;
  String tglSp;
  String noSp;
  int idSupplier;
  String namaSupplier;
  String tipePembelian;
  bool isCito;
  int totalSebelumDiskon;
  int totalDiskon;
  int totalSetelahDiskon;
  bool isPpn;
  int totalPpn;
  int total;
  int idApj;
  int idPptk;
  String jenis;
  String catatan;
  List<BarangPesanan> barang;

  PesananRequest(
      {this.createdBy,
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
    createdBy = json['created_by'];
    tglSp = json['tgl_sp'];
    noSp = json['no_sp'];
    idSupplier = json['id_supplier'];
    namaSupplier = json['nama_supplier'];
    tipePembelian = json['tipe_pembelian'];
    isCito = json['is_cito'];
    totalSebelumDiskon = json['total_sebelum_diskon'];
    totalDiskon = json['total_diskon'];
    totalSetelahDiskon = json['total_setelah_diskon'];
    isPpn = json['is_ppn'];
    totalPpn = json['total_ppn'];
    total = json['total'];
    idApj = json['id_apj'];
    idPptk = json['id_pptk'];
    jenis = json['jenis'];
    catatan = json['catatan'];
    if (json['barang'] != null) {
      barang = <BarangPesanan>[];
      json['barang'].forEach((v) {
        barang.add(BarangPesanan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['tgl_sp'] = this.tglSp;
    data['no_sp'] = this.noSp;
    data['id_supplier'] = this.idSupplier;
    data['nama_supplier'] = this.namaSupplier;
    data['tipe_pembelian'] = this.tipePembelian;
    data['is_cito'] = this.isCito;
    data['total_sebelum_diskon'] = this.totalSebelumDiskon;
    data['total_diskon'] = this.totalDiskon;
    data['total_setelah_diskon'] = this.totalSetelahDiskon;
    data['is_ppn'] = this.isPpn;
    data['total_ppn'] = this.totalPpn;
    data['total'] = this.total;
    data['id_apj'] = this.idApj;
    data['id_pptk'] = this.idPptk;
    data['jenis'] = this.jenis;
    data['catatan'] = this.catatan;
    if (this.barang != null) {
      data['barang'] = this.barang.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BarangPesanan {
  int idBarang;
  int jumlahKemasan;
  int idKemasan;
  int hargaKemasan;
  int isiPerKemasan;
  int jumlahTotal;
  int idSatuan;
  int hargaSatuan;
  int subtotal;
  int diskonPersen;
  int diskonTotal;
  bool isPpn;
  int hargaBeliSekarang;
  int hargaBeliTertinggi;
  int jumlahDiterima;
  String keterangan;

  BarangPesanan(
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
      this.jumlahDiterima,
      this.keterangan});

  BarangPesanan.fromJson(Map<String, dynamic> json) {
    idBarang = json['id_barang'];
    jumlahKemasan = json['jumlah_kemasan'];
    idKemasan = json['id_kemasan'];
    hargaKemasan = json['harga_kemasan'];
    isiPerKemasan = json['isi_per_kemasan'];
    jumlahTotal = json['jumlah_total'];
    idSatuan = json['id_satuan'];
    hargaSatuan = json['harga_satuan'];
    subtotal = json['subtotal'];
    diskonPersen = json['diskon_persen'];
    diskonTotal = json['diskon_total'];
    isPpn = json['is_ppn'];
    hargaBeliSekarang = json['harga_beli_sekarang'];
    hargaBeliTertinggi = json['harga_beli_tertinggi'];
    jumlahDiterima = json['jumlah_diterima'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_barang'] = this.idBarang;
    data['jumlah_kemasan'] = this.jumlahKemasan;
    data['id_kemasan'] = this.idKemasan;
    data['harga_kemasan'] = this.hargaKemasan;
    data['isi_per_kemasan'] = this.isiPerKemasan;
    data['jumlah_total'] = this.jumlahTotal;
    data['id_satuan'] = this.idSatuan;
    data['harga_satuan'] = this.hargaSatuan;
    data['subtotal'] = this.subtotal;
    data['diskon_persen'] = this.diskonPersen;
    data['diskon_total'] = this.diskonTotal;
    data['is_ppn'] = this.isPpn;
    data['harga_beli_sekarang'] = this.hargaBeliSekarang;
    data['harga_beli_tertinggi'] = this.hargaBeliTertinggi;
    data['jumlah_diterima'] = this.jumlahDiterima;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
