import 'package:medis/model/response/supplier_response.dart';

abstract class PesananViewInterface {
  void showMessage(String message, bool error);

  void showSupplier(SupplierResponse supplierResponse);
}
