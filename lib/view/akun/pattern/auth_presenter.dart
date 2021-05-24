import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/farmasi/auth_service.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/request/login_request.dart';
import 'package:medis/model/request/save_token_request.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/view/akun/pattern/auth_view_interface.dart';
import 'package:medis/view/akun/pattern/auth_view_model.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class AuthPresenter extends Presenter<AuthViewModel, AuthViewInterface> {
  AuthPresenter(AuthViewModel model, AuthViewInterface view)
      : super(model, view);

  Future<void> login(LoginRequest request) async {
    EasyLoading.show(status: 'Loading...');
    await AuthService.fetchLogin(request).then((value) {
      if (value is LoginResponse) {
        if (value.status == 200) {
          this.viewModel.loginResponse = value;
          if (value.data.user.username.isNotEmpty) {
            saveToken(value.data.user.username);
          } else {
            viewInterface.saveAccount(this.viewModel.loginResponse);
          }
        } else {
          viewInterface.showMessage(value.message, true);
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

  Future<void> saveToken(String username) async {
    var deviceId = Pref.getDeviceId();
    var token = Pref.getTokenFirebase();

    var request =
        SaveTokenRequest(deviceId: deviceId, username: username, token: token);

    await AuthService.saveToken(request).then((value) {
      viewInterface.saveAccount(this.viewModel.loginResponse);
    });
  }
}
