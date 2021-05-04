import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/config/endpoint.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/request/pesanan_request.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';

class PesananService {
  static Future<dynamic> getListSupplier() async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      final response =
          await http.get(EndpointMedis.supplier, headers: header).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return SupplierResponse.fromJson(body);
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

  static Future<dynamic> getListPesanan() async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      final response =
          await http.get(EndpointMedis.pesanan, headers: header).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return PengadaanResponse.fromJson(body);
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

  static Future<dynamic> addPesanan(PesananRequest pesananRequest) async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      final response = await http
          .post(EndpointMedis.addPesanan,
              headers: header, body: pesananRequest.toJson())
          .timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return AddPesananResponse.fromJson(body);
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
