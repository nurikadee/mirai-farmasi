import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/farmasi/auth_service.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/request/save_token_request.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/view/splash/pattern/splash_view_interface.dart';
import 'package:medis/view/splash/pattern/splash_view_model.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class SplashPresenter extends Presenter<SplashViewModel, SplashViewInterface> {
  SplashPresenter(SplashViewModel model, SplashViewInterface view)
      : super(model, view);

  @override
  Future onInit() async {
    saveToken();
    refreshView();
  }

  Future<void> saveToken() async {
    var username = "0";

    if (Pref.checkIsLoggedIn()) {
      username = Pref.getUserLogin().user.username;
    }

    try {
      var deviceId = Pref.getDeviceId();
      var token = Pref.getTokenFirebase();

      var request = SaveTokenRequest(
          deviceId: deviceId, username: username, token: token);

      await AuthService.saveToken(request).then((value) {
        if (value is BaseResponse) {
          viewModel.baseResponse = value;
          viewInterface.goToHome(value);
        } else {
          viewInterface.showMessage(APiSettings.errorMsg, true);
        }
      });
    } catch (e) {
      viewInterface.goToHome(BaseResponse());
    }
  }
}
