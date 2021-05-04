import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/farmasi/obat_service.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/view/obat/pattern/obat_view_interface.dart';
import 'package:medis/view/obat/pattern/obat_view_model.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class ObatPresenter extends Presenter<ObatViewModel, ObatViewInterface> {
  ObatPage page;

  ObatPresenter(ObatViewModel model, ObatViewInterface view, ObatPage page,
      String dokterId)
      : super(model, view) {
    this.page = page;
  }

  Future<void> getListObat() async {
    EasyLoading.show(
        status:
            'Sedang melakukan download seluruh data obat, mohon menunggu...');

    await ObatService.getListObat().then((value) {
      if (value is ObatResponse) {
        if (value.status == 200) {
          this.viewModel.obatResponse = value;
          this.viewInterface.showListObat(value);
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

enum ObatPage { OBAT }
