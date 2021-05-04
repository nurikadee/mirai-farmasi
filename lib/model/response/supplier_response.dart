class SupplierResponse {
  int status;
  String message;
  SupplierData data;

  SupplierResponse({this.status, this.message, this.data});

  SupplierResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : SupplierData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class SupplierData {
  List<Satuan> satuan;
  List<Supplier> supplier;

  SupplierData({this.satuan, this.supplier});

  SupplierData.fromJson(Map<String, dynamic> json) {
    if (json["satuan"] is List)
      this.satuan = json["satuan"] == null
          ? []
          : (json["satuan"] as List).map((e) => Satuan.fromJson(e)).toList();
    if (json["supplier"] is List)
      this.supplier = json["supplier"] == null
          ? []
          : (json["supplier"] as List)
              .map((e) => Supplier.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.satuan != null)
      data["satuan"] = this.satuan.map((e) => e.toJson()).toList();
    if (this.supplier != null)
      data["supplier"] = this.supplier.map((e) => e.toJson()).toList();
    return data;
  }
}

class Supplier {
  int idSupplier;
  String namaSupplier;
  String alamat;
  String telepon;

  Supplier({this.idSupplier, this.namaSupplier, this.alamat, this.telepon});

  Supplier.fromJson(Map<String, dynamic> json) {
    if (json["id_supplier"] is int) this.idSupplier = json["id_supplier"];
    if (json["nama_supplier"] is String)
      this.namaSupplier = json["nama_supplier"];
    if (json["alamat"] is String) this.alamat = json["alamat"];
    if (json["telepon"] is String) this.telepon = json["telepon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id_supplier"] = this.idSupplier;
    data["nama_supplier"] = this.namaSupplier;
    data["alamat"] = this.alamat;
    data["telepon"] = this.telepon;
    return data;
  }
}

class Satuan {
  int idSatuan;
  String namaSatuan;
  String keterangan;

  Satuan({this.idSatuan, this.namaSatuan, this.keterangan});

  Satuan.fromJson(Map<String, dynamic> json) {
    if (json["id_satuan"] is int) this.idSatuan = json["id_satuan"];
    if (json["nama_satuan"] is String) this.namaSatuan = json["nama_satuan"];
    if (json["keterangan"] is String) this.keterangan = json["keterangan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id_satuan"] = this.idSatuan;
    data["nama_satuan"] = this.namaSatuan;
    data["keterangan"] = this.keterangan;
    return data;
  }
}
