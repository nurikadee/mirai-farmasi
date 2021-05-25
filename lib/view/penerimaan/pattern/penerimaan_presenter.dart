import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/farmasi/penerimaan_service.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_interface.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_model.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class PenerimaanPresenter
    extends Presenter<PenerimaanViewModel, PenerimaanViewInterface> {
  PenerimaanPage page;
  int idPenerimaan;

  PenerimaanPresenter(PenerimaanViewModel model, PenerimaanViewInterface view,
      PenerimaanPage page, int idPenerimaan)
      : super(model, view) {
    this.page = page;
    this.idPenerimaan = idPenerimaan;
  }

  @override
  Future onInit() async {
    switch (page) {
      case PenerimaanPage.RiwayatPenerimaan:
        getListPenerimaan();
        break;
      case PenerimaanPage.DetailRiwayatPenerimaan:
        getDetailRiwayatPenerimaan(idPenerimaan);
        break;
    }
    refreshView();
  }

  Future<void> getListPenerimaan() async {
    EasyLoading.show(status: 'Mohon menunggu...');

    await PenerimaanService.getListPenerimaan().then((value) {
      if (value is PenerimaanResponse) {
        if (value.status == 200) {
          this.viewModel.penerimaanResponse = value;
          this.viewInterface.showRiwayatPenerimaan(value);
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

  Future<void> getDetailRiwayatPenerimaan(int idPenerimaan) async {
    EasyLoading.show(status: 'Mohon menunggu...');

    await PenerimaanService.getDetailRiwayatPenerimaan(idPenerimaan)
        .then((value) {
      if (value is PenerimaanDetailResponse) {
        if (value.status == 200) {
          this.viewModel.penerimaanDetailResponse = value;
          this.viewInterface.showDetailRiwayatPenerimaan(value);
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

enum PenerimaanPage { RiwayatPenerimaan, DetailRiwayatPenerimaan }
