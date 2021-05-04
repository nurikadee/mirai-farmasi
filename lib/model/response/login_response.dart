class LoginResponse {
  int status;
  String message;
  DataUser data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) this.status = json["status"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null ? null : DataUser.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class DataUser {
  User user;
  Pegawai pegawai;
  Sso sso;
  AuthAssignment authAssignment;

  DataUser({this.user, this.pegawai, this.sso, this.authAssignment});

  DataUser.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    if (json["pegawai"] is Map)
      this.pegawai =
          json["pegawai"] == null ? null : Pegawai.fromJson(json["pegawai"]);
    if (json["sso"] is Map)
      this.sso = json["sso"] == null ? null : Sso.fromJson(json["sso"]);
    if (json["auth_assignment"] is Map)
      this.authAssignment = json["auth_assignment"] == null
          ? null
          : AuthAssignment.fromJson(json["auth_assignment"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) data["user"] = this.user.toJson();
    if (this.pegawai != null) data["pegawai"] = this.pegawai.toJson();
    if (this.sso != null) data["sso"] = this.sso.toJson();
    if (this.authAssignment != null)
      data["auth_assignment"] = this.authAssignment.toJson();
    return data;
  }
}

class AuthAssignment {
  String itemName;
  String userId;
  int createdAt;

  AuthAssignment({this.itemName, this.userId, this.createdAt});

  AuthAssignment.fromJson(Map<String, dynamic> json) {
    if (json["item_name"] is String) this.itemName = json["item_name"];
    if (json["user_id"] is String) this.userId = json["user_id"];
    if (json["created_at"] is int) this.createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["item_name"] = this.itemName;
    data["user_id"] = this.userId;
    data["created_at"] = this.createdAt;
    return data;
  }
}

class Sso {
  int userid;
  int idPegawai;
  String username;
  String password;
  String nama;
  String tanggalPendaftaran;
  String role;
  String tokenAktivasi;
  int status;

  Sso(
      {this.userid,
      this.idPegawai,
      this.username,
      this.password,
      this.nama,
      this.tanggalPendaftaran,
      this.role,
      this.tokenAktivasi,
      this.status});

  Sso.fromJson(Map<String, dynamic> json) {
    if (json["userid"] is int) this.userid = json["userid"];
    if (json["id_pegawai"] is int) this.idPegawai = json["id_pegawai"];
    if (json["username"] is String) this.username = json["username"];
    if (json["password"] is String) this.password = json["password"];
    if (json["nama"] is String) this.nama = json["nama"];
    if (json["tanggal_pendaftaran"] is String)
      this.tanggalPendaftaran = json["tanggal_pendaftaran"];
    if (json["role"] is String) this.role = json["role"];
    if (json["token_aktivasi"] is String)
      this.tokenAktivasi = json["token_aktivasi"];
    if (json["status"] is int) this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["userid"] = this.userid;
    data["id_pegawai"] = this.idPegawai;
    data["username"] = this.username;
    data["password"] = this.password;
    data["nama"] = this.nama;
    data["tanggal_pendaftaran"] = this.tanggalPendaftaran;
    data["role"] = this.role;
    data["token_aktivasi"] = this.tokenAktivasi;
    data["status"] = this.status;
    return data;
  }
}

class Pegawai {
  int pegawaiId;
  String idNipNrp;
  String namaLengkap;
  String gelarSarjanaDepan;
  String gelarSarjanaBelakang;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String statusPerkawinan;
  String agama;
  String alamatTempatTinggal;
  String rtTempatTinggal;
  String rwTempatTinggal;
  String desaKelurahan;
  String kecamatan;
  String kabupatenKota;
  String provinsi;
  int kodePos;
  String noTelepon1;
  String noTelepon2;
  String golonganDarah;
  int statusKepegawaianId;
  int jenisKepegawaianId;
  String npwp;
  String nomorKtp;
  String notaPersetujuanBknNomorCpns;
  String notaPersetujuanBknTanggalCpns;
  String pejabatYangMenetapkanCpns;
  String skCpnsNomorCpns;
  String skCpnsTanggalCpns;
  int kodePangkatCpns;
  String tmtCpns;
  String pejabatYangMenetapkanPns;
  String skNomorPns;
  String skTanggalPns;
  String kodePangkatPns;
  String tmtPns;
  String sumpahJanjiPns;
  int tinggiKeteranganBadan;
  int beratBadanKeteranganBadan;
  String rambutKeteranganBadan;
  String bentukMukaKeteranganBadan;
  String warnaKulitKeteranganBadan;
  String ciriCiriKhasKeteranganBadan;
  String cacatTubuhKeteranganBadan;
  String kegemaran1;
  String kegemaran2;
  String kegemaran3;
  String photo;
  int statusAktifPegawai;
  int tipeUser;
  String kodeDokterMapingSimrs;

  Pegawai(
      {this.pegawaiId,
      this.idNipNrp,
      this.namaLengkap,
      this.gelarSarjanaDepan,
      this.gelarSarjanaBelakang,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.statusPerkawinan,
      this.agama,
      this.alamatTempatTinggal,
      this.rtTempatTinggal,
      this.rwTempatTinggal,
      this.desaKelurahan,
      this.kecamatan,
      this.kabupatenKota,
      this.provinsi,
      this.kodePos,
      this.noTelepon1,
      this.noTelepon2,
      this.golonganDarah,
      this.statusKepegawaianId,
      this.jenisKepegawaianId,
      this.npwp,
      this.nomorKtp,
      this.notaPersetujuanBknNomorCpns,
      this.notaPersetujuanBknTanggalCpns,
      this.pejabatYangMenetapkanCpns,
      this.skCpnsNomorCpns,
      this.skCpnsTanggalCpns,
      this.kodePangkatCpns,
      this.tmtCpns,
      this.pejabatYangMenetapkanPns,
      this.skNomorPns,
      this.skTanggalPns,
      this.kodePangkatPns,
      this.tmtPns,
      this.sumpahJanjiPns,
      this.tinggiKeteranganBadan,
      this.beratBadanKeteranganBadan,
      this.rambutKeteranganBadan,
      this.bentukMukaKeteranganBadan,
      this.warnaKulitKeteranganBadan,
      this.ciriCiriKhasKeteranganBadan,
      this.cacatTubuhKeteranganBadan,
      this.kegemaran1,
      this.kegemaran2,
      this.kegemaran3,
      this.photo,
      this.statusAktifPegawai,
      this.tipeUser,
      this.kodeDokterMapingSimrs});

  Pegawai.fromJson(Map<String, dynamic> json) {
    pegawaiId = json['pegawai_id'];
    idNipNrp = json['id_nip_nrp'];
    namaLengkap = json['nama_lengkap'];
    gelarSarjanaDepan = json['gelar_sarjana_depan'];
    gelarSarjanaBelakang = json['gelar_sarjana_belakang'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    statusPerkawinan = json['status_perkawinan'];
    agama = json['agama'];
    alamatTempatTinggal = json['alamat_tempat_tinggal'];
    rtTempatTinggal = json['rt_tempat_tinggal'];
    rwTempatTinggal = json['rw_tempat_tinggal'];
    desaKelurahan = json['desa_kelurahan'];
    kecamatan = json['kecamatan'];
    kabupatenKota = json['kabupaten_kota'];
    provinsi = json['provinsi'];
    kodePos = json['kode_pos'];
    noTelepon1 = json['no_telepon_1'];
    noTelepon2 = json['no_telepon_2'];
    golonganDarah = json['golongan_darah'];
    statusKepegawaianId = json['status_kepegawaian_id'];
    jenisKepegawaianId = json['jenis_kepegawaian_id'];
    npwp = json['npwp'];
    nomorKtp = json['nomor_ktp'];
    notaPersetujuanBknNomorCpns = json['nota_persetujuan_bkn_nomor_cpns'];
    notaPersetujuanBknTanggalCpns = json['nota_persetujuan_bkn_tanggal_cpns'];
    pejabatYangMenetapkanCpns = json['pejabat_yang_menetapkan_cpns'];
    skCpnsNomorCpns = json['sk_cpns_nomor_cpns'];
    skCpnsTanggalCpns = json['sk_cpns_tanggal_cpns'];
    kodePangkatCpns = json['kode_pangkat_cpns'];
    tmtCpns = json['tmt_cpns'];
    pejabatYangMenetapkanPns = json['pejabat_yang_menetapkan_pns'];
    skNomorPns = json['sk_nomor_pns'];
    skTanggalPns = json['sk_tanggal_pns'];
    kodePangkatPns = json['kode_pangkat_pns'];
    tmtPns = json['tmt_pns'];
    sumpahJanjiPns = json['sumpah_janji_pns'];
    tinggiKeteranganBadan = json['tinggi_keterangan_badan'];
    beratBadanKeteranganBadan = json['berat_badan_keterangan_badan'];
    rambutKeteranganBadan = json['rambut_keterangan_badan'];
    bentukMukaKeteranganBadan = json['bentuk_muka_keterangan_badan'];
    warnaKulitKeteranganBadan = json['warna_kulit_keterangan_badan'];
    ciriCiriKhasKeteranganBadan = json['ciri_ciri_khas_keterangan_badan'];
    cacatTubuhKeteranganBadan = json['cacat_tubuh_keterangan_badan'];
    kegemaran1 = json['kegemaran_1'];
    kegemaran2 = json['kegemaran_2'];
    kegemaran3 = json['kegemaran_3'];
    photo = json['photo'];
    statusAktifPegawai = json['status_aktif_pegawai'];
    tipeUser = json['tipe_user'];
    kodeDokterMapingSimrs = json['kode_dokter_maping_simrs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pegawai_id'] = this.pegawaiId;
    data['id_nip_nrp'] = this.idNipNrp;
    data['nama_lengkap'] = this.namaLengkap;
    data['gelar_sarjana_depan'] = this.gelarSarjanaDepan;
    data['gelar_sarjana_belakang'] = this.gelarSarjanaBelakang;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['status_perkawinan'] = this.statusPerkawinan;
    data['agama'] = this.agama;
    data['alamat_tempat_tinggal'] = this.alamatTempatTinggal;
    data['rt_tempat_tinggal'] = this.rtTempatTinggal;
    data['rw_tempat_tinggal'] = this.rwTempatTinggal;
    data['desa_kelurahan'] = this.desaKelurahan;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten_kota'] = this.kabupatenKota;
    data['provinsi'] = this.provinsi;
    data['kode_pos'] = this.kodePos;
    data['no_telepon_1'] = this.noTelepon1;
    data['no_telepon_2'] = this.noTelepon2;
    data['golongan_darah'] = this.golonganDarah;
    data['status_kepegawaian_id'] = this.statusKepegawaianId;
    data['jenis_kepegawaian_id'] = this.jenisKepegawaianId;
    data['npwp'] = this.npwp;
    data['nomor_ktp'] = this.nomorKtp;
    data['nota_persetujuan_bkn_nomor_cpns'] = this.notaPersetujuanBknNomorCpns;
    data['nota_persetujuan_bkn_tanggal_cpns'] =
        this.notaPersetujuanBknTanggalCpns;
    data['pejabat_yang_menetapkan_cpns'] = this.pejabatYangMenetapkanCpns;
    data['sk_cpns_nomor_cpns'] = this.skCpnsNomorCpns;
    data['sk_cpns_tanggal_cpns'] = this.skCpnsTanggalCpns;
    data['kode_pangkat_cpns'] = this.kodePangkatCpns;
    data['tmt_cpns'] = this.tmtCpns;
    data['pejabat_yang_menetapkan_pns'] = this.pejabatYangMenetapkanPns;
    data['sk_nomor_pns'] = this.skNomorPns;
    data['sk_tanggal_pns'] = this.skTanggalPns;
    data['kode_pangkat_pns'] = this.kodePangkatPns;
    data['tmt_pns'] = this.tmtPns;
    data['sumpah_janji_pns'] = this.sumpahJanjiPns;
    data['tinggi_keterangan_badan'] = this.tinggiKeteranganBadan;
    data['berat_badan_keterangan_badan'] = this.beratBadanKeteranganBadan;
    data['rambut_keterangan_badan'] = this.rambutKeteranganBadan;
    data['bentuk_muka_keterangan_badan'] = this.bentukMukaKeteranganBadan;
    data['warna_kulit_keterangan_badan'] = this.warnaKulitKeteranganBadan;
    data['ciri_ciri_khas_keterangan_badan'] = this.ciriCiriKhasKeteranganBadan;
    data['cacat_tubuh_keterangan_badan'] = this.cacatTubuhKeteranganBadan;
    data['kegemaran_1'] = this.kegemaran1;
    data['kegemaran_2'] = this.kegemaran2;
    data['kegemaran_3'] = this.kegemaran3;
    data['photo'] = this.photo;
    data['status_aktif_pegawai'] = this.statusAktifPegawai;
    data['tipe_user'] = this.tipeUser;
    data['kode_dokter_maping_simrs'] = this.kodeDokterMapingSimrs;
    return data;
  }
}

class User {
  int id;
  String username;
  String passwordHash;
  int status;
  String authKey;
  String passwordResetToken;
  String accountActivationToken;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.username,
      this.passwordHash,
      this.status,
      this.authKey,
      this.passwordResetToken,
      this.accountActivationToken,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["username"] is String) this.username = json["username"];
    if (json["password_hash"] is String)
      this.passwordHash = json["password_hash"];
    if (json["status"] is int) this.status = json["status"];
    if (json["auth_key"] is String) this.authKey = json["auth_key"];
    if (json["password_reset_token"] is String)
      this.passwordResetToken = json["password_reset_token"];
    if (json["account_activation_token"] is String)
      this.accountActivationToken = json["account_activation_token"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = this.id;
    data["username"] = this.username;
    data["password_hash"] = this.passwordHash;
    data["status"] = this.status;
    data["auth_key"] = this.authKey;
    data["password_reset_token"] = this.passwordResetToken;
    data["account_activation_token"] = this.accountActivationToken;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
