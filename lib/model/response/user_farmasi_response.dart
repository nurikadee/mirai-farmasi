class UserFarmasiResponse {
  int status;
  String message;
  UserFarmasiData data;

  UserFarmasiResponse({this.status, this.message, this.data});

  UserFarmasiResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data =
          json["data"] == null ? null : UserFarmasiData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class UserFarmasiData {
  UserFarmasi ppk;
  UserFarmasi kepalaInstalasi;
  List<UserFarmasi> anggotaInstalasi;

  UserFarmasiData({this.ppk, this.kepalaInstalasi, this.anggotaInstalasi});

  UserFarmasiData.fromJson(Map<String, dynamic> json) {
    if (json["ppk"] is Map)
      this.ppk = json["ppk"] == null ? null : UserFarmasi.fromJson(json["ppk"]);
    if (json["kepala_instalasi"] is Map)
      this.kepalaInstalasi = json["kepala_instalasi"] == null
          ? null
          : UserFarmasi.fromJson(json["kepala_instalasi"]);
    if (json["anggota_instalasi"] is List)
      this.anggotaInstalasi = json["anggota_instalasi"] == null
          ? []
          : (json["anggota_instalasi"] as List)
              .map((e) => UserFarmasi.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ppk != null) data["ppk"] = this.ppk.toJson();
    if (this.kepalaInstalasi != null)
      data["kepala_instalasi"] = this.kepalaInstalasi.toJson();
    if (this.anggotaInstalasi != null)
      data["anggota_instalasi"] =
          this.anggotaInstalasi.map((e) => e.toJson()).toList();
    return data;
  }
}

class UserFarmasi {
  int pegawaiId;
  String idNipNrp;
  String namaLengkap;
  String gelarSarjanaDepan;
  String gelarSarjanaBelakang;

  UserFarmasi(
      {this.pegawaiId,
      this.idNipNrp,
      this.namaLengkap,
      this.gelarSarjanaDepan,
      this.gelarSarjanaBelakang});

  UserFarmasi.fromJson(Map<String, dynamic> json) {
    if (json["pegawai_id"] is int) this.pegawaiId = json["pegawai_id"];
    if (json["id_nip_nrp"] is String) this.idNipNrp = json["id_nip_nrp"];
    if (json["nama_lengkap"] is String) this.namaLengkap = json["nama_lengkap"];
    if (json["gelar_sarjana_depan"] is String)
      this.gelarSarjanaDepan = json["gelar_sarjana_depan"];
    if (json["gelar_sarjana_belakang"] is String)
      this.gelarSarjanaBelakang = json["gelar_sarjana_belakang"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["pegawai_id"] = this.pegawaiId;
    data["id_nip_nrp"] = this.idNipNrp;
    data["nama_lengkap"] = this.namaLengkap;
    data["gelar_sarjana_depan"] = this.gelarSarjanaDepan;
    data["gelar_sarjana_belakang"] = this.gelarSarjanaBelakang;
    return data;
  }
}
