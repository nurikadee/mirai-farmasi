import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/model/response/supplier_response.dart';

class FarmasiStorage {
  static LocalStorage storage;

  static initStorage() {
    storage = LocalStorage('mirai_farmasi');
  }

  static clearStorage() async {
    await storage.clear();
  }

  // ----- OBAT ------ //

  static clearObatStorage() async {
    await storage.deleteItem('obat');
  }

  static saveObatToStorage(ObatResponse obatResponse) {
    clearObatStorage();
    storage.setItem('obat', json.encode(obatResponse));
  }

  static ObatResponse getObatStorage() {
    if (storage.getItem('obat') != null) {
      var data = json.decode(storage.getItem('obat'));
      return ObatResponse.fromJson(data);
    } else {
      return null;
    }
  }

  // ----- CART ------ //

  static clearCartStorage() async {
    await storage.deleteItem('cart');
  }

  static addAllToCart(DataObat dataObat) {
    clearCartStorage();
    storage.setItem('cart', json.encode(dataObat));
  }

  static addToCart(Barang obat) {
    DataObat dataObat = DataObat();

    if (getCartStorage() != null) {
      dataObat = getCartStorage();
      List<Barang> currentList = dataObat.barang;
      currentList.add(obat);

      dataObat.count = dataObat.count + 1;
      dataObat.barang = currentList;
    } else {
      dataObat.count = 1;
      dataObat.barang = [obat];
    }

    clearCartStorage();
    storage.setItem('cart', json.encode(dataObat));
  }

  static removeToCart(Barang obat) {
    DataObat dataObat = DataObat();

    if (getCartStorage() != null) {
      dataObat = getCartStorage();
      List<Barang> currentList = dataObat.barang;
      var toRemove = [];

      currentList.forEach((e) {
        if (e.idBarang == obat.idBarang) toRemove.add(e);
      });

      currentList.removeWhere((e) => toRemove.contains(e));

      dataObat.count = dataObat.count - 1;
      dataObat.barang = currentList;
    } else {
      dataObat.count = 0;
      dataObat.barang = [];
    }
    clearCartStorage();
    storage.setItem('cart', json.encode(dataObat));
  }

  static DataObat getCartStorage() {
    if (storage.getItem('cart') != null) {
      var data = json.decode(storage.getItem('cart'));
      return DataObat.fromJson(data);
    } else {
      return null;
    }
  }

  static bool checkBarangOnCart(Barang obat) {
    DataObat data = getCartStorage();
    if (data != null) {
      for (Barang barang in data.barang) {
        if (barang.idBarang == obat.idBarang) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }

  // ----- SUPPLIER ------ //

  static clearSupplierStorage() async {
    await storage.deleteItem('supplier');
  }

  static saveSupplierToStorage(SupplierResponse supplierResponse) {
    clearSupplierStorage();
    storage.setItem('supplier', json.encode(supplierResponse));
  }

  static SupplierResponse getSupplierStorage() {
    if (storage.getItem('supplier') != null) {
      var data = json.decode(storage.getItem('supplier'));
      return SupplierResponse.fromJson(data);
    } else {
      return null;
    }
  }
}
