import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';

abstract class PenerimaanViewInterface {
  void showMessage(String message, bool error);

  void showRiwayatPenerimaan(PenerimaanResponse penerimaanResponse);

  void showDetailRiwayatPenerimaan(
      PenerimaanDetailResponse penerimaanDetailResponse);
}
