import 'package:flutter/material.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/request/pesanan_request.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:medis/widgets/item_cart_no_action.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class PesananDetail extends StatefulWidget {
  final PesananRequest pesananRequest;

  PesananDetail({Key key, this.pesananRequest}) : super(key: key);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<PesananDetail> with PesananViewInterface {
  PesananRequest pesananRequest;
  DataObat dataCart;

  @override
  void initState() {
    super.initState();
    this.pesananRequest = widget.pesananRequest;
    this.dataCart = FarmasiStorage.getCartStorage();
  }

  @override
  Widget build(BuildContext context) {
    return MVVMPage<PesananPresenter, PesananViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Detail Pesanan"),
            ),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Card(
                      elevation: 0.5,
                      child: ListTile(
                          title: Text("No Surat Pesanan",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          subtitle: Text(pesananRequest.noSp,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  Card(
                      elevation: 0.5,
                      child: ListTile(
                          title: Text("Tanggal Surat Pesanan",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          subtitle: Text(pesananRequest.tglSp,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  Card(
                      elevation: 0.5,
                      child: ListTile(
                          title: Text("Nama Distributor",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          subtitle: Text(pesananRequest.namaSupplier,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  Card(
                      elevation: 0.5,
                      child: ListTile(
                          title: Text("Tipe Pembelian",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          subtitle: Text(pesananRequest.tipePembelian,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  Card(
                      elevation: 0.5,
                      child: ListTile(
                          title: Text("CITO",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          subtitle: Text(pesananRequest.isCito ? "YA" : "TIDAK",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataCart.barang.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ItemCartNoAction(obat: dataCart.barang[index]);
                      }),
                ],
              ),
            ));
      },
      presenter:
          PesananPresenter(PesananViewModel(), this, PesananPage.Pesanan),
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
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
