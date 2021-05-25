class APiSettings {
  static var baseUrlFarmasi = "http://192.168.1.186/mirai-farmasi/v1/";

  static var errorMsg =
      "Terjadi kesalahan pada server, mohon ulangi beberapa saat lagi";
  static var errorNetwork =
      "Tidak dapat terhubung ke server, periksa kembali jaringan internet anda";

  static Map<String, String> getHeader(bearer) {
    if (bearer == null) {
      return {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      };
    } else {
      return {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": bearer
      };
    }
  }
}
