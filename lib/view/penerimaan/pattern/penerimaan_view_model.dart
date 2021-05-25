import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class PenerimaanViewModel extends MVVMModel {
  BaseResponse baseResponse;

  PenerimaanResponse penerimaanResponse;

  PenerimaanDetailResponse penerimaanDetailResponse;
}
