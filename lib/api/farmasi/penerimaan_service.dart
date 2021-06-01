import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:medis/api/config/apisettings.dart';
import 'package:medis/api/config/endpoint.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/request/penerimaan_by_id_request.dart';
import 'package:medis/model/request/penerimaan_request.dart';
import 'package:medis/model/response/add_penerimaan_response.dart';
import 'package:medis/model/response/base_response.dart';
import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';

class PenerimaanService {
  static Future<dynamic> getListPenerimaan() async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      final response =
          await http.get(EndpointMedis.penerimaan, headers: header).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return PenerimaanResponse.fromJson(body);
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

  static getDetailRiwayatPenerimaan(int idPenerimaan) async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      PenerimaanByIdRequest request = PenerimaanByIdRequest();
      request.idPenerimaan = idPenerimaan.toString();

      final response = await http
          .post(EndpointMedis.penerimaanById,
              headers: header, body: request.toJson())
          .timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      developer.log("${request.toJson()}",
          name: "Request ${EndpointMedis.pesananById}");

      developer.log("${jsonDecode(response.body)}",
          name: "Response ${EndpointMedis.pesananById}");

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return PenerimaanDetailResponse.fromJson(body);
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

  static Future<dynamic> addPenerimaan(
      PenerimaanRequest penerimaanRequest) async {
    var header;
    await Pref.getUserLogin().then((value) {
      header = APiSettings.getHeader("Bearer ${value.user.authKey}");
    });

    try {
      developer.log("${penerimaanRequest.toJson()}",
          name: "Request ${EndpointMedis.addPenerimaan}");

      final response = await http
          .post(EndpointMedis.addPenerimaan,
              headers: header, body: json.encode(penerimaanRequest))
          .timeout(
        Duration(seconds: 20),
        onTimeout: () {
          return null;
        },
      );

      developer.log("${jsonDecode(response.body)}",
          name: "Response ${EndpointMedis.addPesanan}");

      switch (response.statusCode) {
        case 200:
          final body = jsonDecode(response.body);
          return AddPenerimaanResponse.fromJson(body);
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
