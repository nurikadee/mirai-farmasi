import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/view/akun/login.dart';
import 'package:medis/view/home/bottombar.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/utilities/version_checking.dart';
import 'package:medis/view/splash/pattern/splash_presenter.dart';
import 'package:medis/view/splash/pattern/splash_view_interface.dart';
import 'package:medis/view/splash/pattern/splash_view_model.dart';
import 'package:toast/toast.dart';

String versionName = '1.0.0';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> implements SplashViewInterface {
  var isLoggedIn = false;
  var customShowUpdateDialog;
  VersionCheck versionCheck;

  String version = '';
  String storeVersion = '';
  String storeUrl = '';
  String packageName = '';

  @override
  void initState() {
    super.initState();

    checkVersion();
    checkIsLoggedIn();
  }

  Future checkVersion() async {
    try {
      if (Platform.isAndroid) {
        packageName = 'com.rsudaa.farmasi';
      } else if (Platform.isIOS) {
        packageName = 'com.rsudaa.farmasi';
      }
    } on PlatformException {}

    versionCheck = VersionCheck(
      packageName: packageName,
      packageVersion: versionName,
    );

    await versionCheck.checkVersion(context);
    setState(() {
      version = versionCheck.packageVersion;
      packageName = versionCheck.packageName;
      storeVersion = versionCheck.storeVersion;
      storeUrl = versionCheck.storeUrl;
    });
  }

  void checkIsLoggedIn() {
    Pref.checkIsLoggedIn().then((seen) => {
          if (seen)
            {
              setState(() {
                isLoggedIn = true;
              })
            }
          else
            {
              setState(() {
                isLoggedIn = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MVVMPage<SplashPresenter, SplashViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'MIRAI SIMFARSAA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'QuickSand',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Mobile Information System \nof RSUD Arifin Achmad Pekanbaru',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'QuickSand',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 50),
                      Expanded(
                        child: Container(
                            child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                          height: 150,
                        )),
                      ),
                      SizedBox(height: 150),
                      Text(
                        'version. $versionName',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      presenter: SplashPresenter(SplashViewModel(), this),
    );
  }

  @override
  void showMessage(String message, bool error) {
    Toast.show(
      message,
      context,
      backgroundColor: error ? Colors.red : Colors.green[400],
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
    );
  }

  @override
  void goToHome(BaseResponse baseResponse) {
    print(baseResponse.message);
    Timer(Duration(milliseconds: 1500), () {
      if (!versionCheck.hasUpdate) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => isLoggedIn ? BottomBar() : Login(),
            ));
      }
    });
  }
}
