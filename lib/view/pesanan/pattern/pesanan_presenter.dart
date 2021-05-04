import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/farmasi/pesanan_service.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class PesananPresenter
    extends Presenter<PesananViewModel, PesananViewInterface> {
  PesananPage page;

  PesananPresenter(
      PesananViewModel model, PesananViewInterface view, PesananPage page)
      : super(model, view) {
    this.page = page;
  }

  @override
  Future onInit() async {
    if (page == PesananPage.Pesanan) {
      getListSupplier();
    }
    refreshView();
  }

  Future<void> getListSupplier() async {
    EasyLoading.show(status: 'Mohon menunggu...');

    await PesananService.getListSupplier().then((value) {
      if (value is SupplierResponse) {
        if (value.status == 200) {
          this.viewModel.supplierResponse = value;
          this.viewInterface.showSupplier(value);
        }
      } else if (value is BaseResponse) {
        viewInterface.showMessage(value.message, true);
      } else {
        viewInterface.showMessage(APiSettings.errorMsg, true);
      }

      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    });
  }
}

enum PesananPage { Pesanan }
