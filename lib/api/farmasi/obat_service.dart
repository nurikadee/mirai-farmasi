import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/config/endpoint.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/obat_response.dart';

class ObatService {
  static Future<dynamic> getListObat() async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      final response =
          await http.get(EndpointMedis.obat, headers: header).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return ObatResponse.fromJson(body);
          break;
        case 400:
          final body = jsonDecode(response.body);
          return BaseResponse.fromJson(body);
          break;
        default:
          return BaseResponse(message: APiSettings.errorMsg);
          break;
      }
    } on SocketException {
      return BaseResponse(message: APiSettings.errorNetwork);
    }
  }
}
