import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/model/response/pengadaan_detail_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:medis/utilities/search_page.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:medis/widgets/item_pengadaan.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class RiwayatPesanan extends StatefulWidget {
  RiwayatPesanan({Key key}) : super(key: key);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<RiwayatPesanan> with PesananViewInterface {
  DataUser dataUser;
  PengadaanResponse pengadaanResponse;

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }

  void checkIsLoggedIn() {
    Pref.checkIsLoggedIn().then((seen) {
      Pref.getUserLogin().then((value) {
        dataUser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MVVMPage<PesananPresenter, PesananViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Riwayat Pesanan",
                  style: TextStyle(color: Colors.grey[700])),
              backgroundColor: Colors.grey[100],
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  tooltip: 'Cari Pesanan',
                  onPressed: () => showSearch(
                    context: this.context,
                    delegate: SearchPage<Pengadaan>(
                        items: pengadaanResponse.data.pengadaan,
                        searchLabel: 'Cari Pesanan',
                        suggestion: Center(
                          child: Text('Cari Pesanan berdasarkan nomor pesanan'),
                        ),
                        failure: Center(
                          child: Text('Data Pesanan tidak ditemukan'),
                        ),
                        filter: (pengadaan) => [
                              pengadaan.noSp,
                            ],
                        builder: (obat) => ItemPengadaan(pengadaan: obat),
                        barTheme: Theme.of(this.context).copyWith(
                          primaryColor: Colors.grey[100],
                          primaryIconTheme:
                              const IconThemeData.fallback().copyWith(
                            color: Colors.grey,
                          ),
                          accentColor: Colors.grey,
                          textTheme: Theme.of(this.context).textTheme.copyWith(
                                headline6: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                          inputDecorationTheme: InputDecorationTheme(
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            focusColor: Colors.grey,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            body: Container(
                color: Colors.grey[100],
                padding: EdgeInsets.only(left: 10, right: 10),
                child: pengadaanResponse != null
                    ? ListView.builder(
                        itemCount: pengadaanResponse.data.pengadaan.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ItemPengadaan(
                              pengadaan:
                                  pengadaanResponse.data.pengadaan[index]);
                        })
                    : Container()));
      },
      presenter: PesananPresenter(
          PesananViewModel(), this, PesananPage.RiwayatPesanan, null),
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
  void showSupplier(SupplierResponse supplierResponse) {}

  @override
  void showUserFarmasi(UserFarmasiResponse userFarmasiResponse) {}

  @override
  void afterAddPesanan(AddPesananResponse addPesananResponse) {}

  @override
  void showRiwayatPesanan(PengadaanResponse pengadaanResponse) {
    setState(() {
      this.pengadaanResponse = pengadaanResponse;
    });
  }

  @override
  void showDetailRiwayatPesanan(
      PengadaanDetailResponse pengadaanDetailResponse) {}

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
