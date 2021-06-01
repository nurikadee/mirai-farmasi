import 'apisettings.dart';

class EndpointMedis {
  static var saveToken =
      Uri.parse(APiSettings.baseUrlFarmasi + "auth/save-token");
  static var login = Uri.parse(APiSettings.baseUrlFarmasi + "auth/login");
  static var obat = Uri.parse(APiSettings.baseUrlFarmasi + "barang/all");
  static var supplier = Uri.parse(APiSettings.baseUrlFarmasi + "supplier/all");
  static var pesanan = Uri.parse(APiSettings.baseUrlFarmasi + "pesanan/all");
  static var pesananById =
      Uri.parse(APiSettings.baseUrlFarmasi + "pesanan/by-id");
  static var addPesanan =
      Uri.parse(APiSettings.baseUrlFarmasi + "pesanan/add-pesanan");
  static var userFarmasi =
      Uri.parse(APiSettings.baseUrlFarmasi + "user/get-user-farmasi");
  static var penerimaan =
      Uri.parse(APiSettings.baseUrlFarmasi + "penerimaan/all");
  static var penerimaanById =
      Uri.parse(APiSettings.baseUrlFarmasi + "penerimaan/by-id");
  static var addPenerimaan =
      Uri.parse(APiSettings.baseUrlFarmasi + "penerimaan/add-penerimaan");
}
