import 'package:medis/model/response/obat_response.dart';

abstract class ObatViewInterface {
  void showMessage(String message, bool error);

  void showListObat(ObatResponse obatResponse);
}
