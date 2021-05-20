import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';

abstract class PesananViewInterface {
  void showMessage(String message, bool error);

  void showSupplier(SupplierResponse supplierResponse);

  void showUserFarmasi(UserFarmasiResponse userFarmasiResponse);

  void afterAddPesanan(AddPesananResponse addPesananResponse);
}
