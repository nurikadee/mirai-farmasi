import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/view/obat/pattern/obat_presenter.dart';
import 'package:medis/view/obat/pattern/obat_view_interface.dart';
import 'package:medis/view/obat/pattern/obat_view_model.dart';
import 'package:medis/view/obat/search_page.dart';
import 'package:medis/view/pesanan/pesanan.dart';
import 'package:medis/widgets/item_obat.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class ObatScreen extends StatefulWidget {
  @override
  _ObatState createState() => _ObatState();
}

class _ObatState extends State<ObatScreen>
    with ObatViewInterface, LifecycleAware, LifecycleMixin {
  var listData = ListView();

  ObatPresenter obatPresenter;
  ObatResponse obatResponse;
  DataObat dataCart;

  List<Barang> listObat;
  int countObat = 0;
  int countCart = 0;

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    if (event == LifecycleEvent.active) {
      setState(() {
        callback();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.obatResponse = FarmasiStorage.getObatStorage();

    if (obatResponse != null) {
      this.listObat = obatResponse.data.barang;
      this.countObat = obatResponse.data.count;
    }

    callback();
  }

  callback() {
    setState(() {
      this.dataCart = FarmasiStorage.getCartStorage();
      if (dataCart != null) {
        this.countCart = dataCart.count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (obatResponse != null) {
      listData = ListView.builder(
          itemCount: listObat.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ItemObat(callback: callback, obat: listObat[index]);
          });
    } else {
      listData = ListView(
        children: <Widget>[
          Container(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Data obat belum tersedia pada aplikasi ini, " +
                      "harap lakukan download seluruh data obat untuk " +
                      "memulai transaksi",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      obatPresenter.getListObat();
                    },
                    child: Text("Download Data Obat",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))),
              ],
            ),
          )))
        ],
      );
    }

    return MVVMPage<ObatPresenter, ObatViewModel>(
      builder: (context, presenter, model) {
        obatPresenter = presenter;
        return Scaffold(
            appBar: AppBar(
              title: Text("Obat [$countObat]"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Cari Obat',
                  onPressed: () => showSearch(
                    context: this.context,
                    delegate: SearchPage<Barang>(
                      items: obatResponse.data.barang,
                      searchLabel: 'Cari Obat',
                      suggestion: Center(
                        child: Text(
                            'Cari Obat berdasarkan kode, nama, tipe dan jenis'),
                      ),
                      failure: Center(
                        child: Text('Data Obat tidak ditemukan'),
                      ),
                      filter: (obat) => [
                        obat.kodeBarang,
                        obat.namaBarang,
                        obat.tipeBarang,
                        obat.namaJenis
                      ],
                      builder: (obat) =>
                          ItemObat(callback: callback, obat: obat),
                    ),
                  ),
                ),
              ],
            ),
            body: listData,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Badge(
                        position: BadgePosition.topStart(),
                        toAnimate: true,
                        animationType: BadgeAnimationType.slide,
                        shape: BadgeShape.circle,
                        badgeContent: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            countCart.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        badgeColor: Colors.red,
                        child: FloatingActionButton.extended(
                            heroTag: "Buat Pesanan",
                            label: Text('Buat Pesanan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Colors.white),
                            backgroundColor: Colors.green,
                            tooltip: 'Buat Pesanan',
                            onPressed: () {
                              Navigator.push(
                                  this.context,
                                  MaterialPageRoute(
                                    builder: (ctx) => Pesanan(),
                                  ));
                            })),
                    SizedBox(height: 5),
                    FloatingActionButton.extended(
                        heroTag: "Refresh Data Obat",
                        label: Text('Refresh Data Obat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        icon: Icon(FontAwesomeIcons.pills, color: Colors.white),
                        backgroundColor: Colors.blue,
                        tooltip: 'Refresh Data Obat',
                        onPressed: () {
                          obatPresenter.getListObat();
                        })
                  ],
                ),
              ),
            ));
      },
      presenter: ObatPresenter(ObatViewModel(), this, ObatPage.OBAT, null),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
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
  void showListObat(ObatResponse obatResponse) {
    setState(() {
      this.obatResponse = obatResponse;
      this.listObat = obatResponse.data.barang;
      this.countObat = obatResponse.data.count;
      FarmasiStorage.saveObatToStorage(obatResponse);
    });
  }
}
