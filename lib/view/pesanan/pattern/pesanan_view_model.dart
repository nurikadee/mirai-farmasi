import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class PesananViewModel extends MVVMModel {
  BaseResponse baseResponse;

  SupplierResponse supplierResponse;

  UserFarmasiResponse userFarmasiResponse;

  AddPesananResponse addPesananResponse;
}
