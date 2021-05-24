import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/response/login_response.dart';

import 'key.dart';

class Pref {
  static LocalStorage sharePref;

  static initStorage() {
    sharePref = FarmasiStorage.storage;
  }

  static clearStorage() async {
    await sharePref.clear();
  }

  static bool checkIsLoggedIn() {
    if (sharePref.getItem(SharedPrefKey.isLoggedInKey) != null) {
      return sharePref.getItem(SharedPrefKey.isLoggedInKey);
    } else {
      return false;
    }
  }

  static DataUser getUserLogin() {
    if (sharePref.getItem(SharedPrefKey.userLogin) != null) {
      var data = json.decode(sharePref.getItem(SharedPrefKey.userLogin));
      return DataUser.fromJson(data);
    } else {
      return null;
    }
  }

  static setUserLogin(DataUser value) async {
    remove();
    bool isLoggedIn = true;
    sharePref.setItem(SharedPrefKey.userLogin, json.encode(value));
    sharePref.setItem(SharedPrefKey.isLoggedInKey, isLoggedIn);
  }

  static setTokenFirebase(String value) async {
    clearToken();
    sharePref.setItem(SharedPrefKey.tokenPushNotif, value);
  }

  static String getTokenFirebase() {
    if (sharePref.getItem(SharedPrefKey.tokenPushNotif) != null) {
      return sharePref.getItem(SharedPrefKey.tokenPushNotif);
    } else {
      return "";
    }
  }

  static setDeviceId(String value) async {
    clearDeviceId();
    sharePref.setItem(SharedPrefKey.deviceId, value);
  }

  static String getDeviceId() {
    if (sharePref.getItem(SharedPrefKey.deviceId) != null) {
      return sharePref.getItem(SharedPrefKey.deviceId);
    } else {
      return "";
    }
  }

  static clearToken() async {
    await sharePref.deleteItem(SharedPrefKey.tokenPushNotif);
  }

  static clearDeviceId() async {
    await sharePref.deleteItem(SharedPrefKey.deviceId);
  }

  static bool remove() {
    sharePref.deleteItem(SharedPrefKey.isLoggedInKey);
    sharePref.deleteItem(SharedPrefKey.userLogin);

    FarmasiStorage.clearCartStorage();
    return true;
  }
}
