import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';
import 'package:medis/utilities/search_page.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_presenter.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_interface.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_model.dart';
import 'package:medis/widgets/item_penerimaan.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class RiwayatPenerimaan extends StatefulWidget {
  RiwayatPenerimaan({Key key}) : super(key: key);

  @override
  _PenerimaanState createState() => _PenerimaanState();
}

class _PenerimaanState extends State<RiwayatPenerimaan>
    with PenerimaanViewInterface {
  DataUser dataUser;
  PenerimaanResponse penerimaanResponse;

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
    return MVVMPage<PenerimaanPresenter, PenerimaanViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Riwayat Penerimaan",
                  style: TextStyle(color: Colors.white)),
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  tooltip: 'Cari Penerimaan',
                  onPressed: () => showSearch(
                    context: this.context,
                    delegate: SearchPage<Penerimaan>(
                      items: penerimaanResponse.data.penerimaan,
                      searchLabel: 'Cari Penerimaan',
                      suggestion: Center(
                        child:
                            Text('Cari Penerimaan berdasarkan nomor pesanan'),
                      ),
                      failure: Center(
                        child: Text('Data Penerimaan tidak ditemukan'),
                      ),
                      filter: (penerimaan) => [
                        penerimaan.noPenerimaan,
                      ],
                      builder: (penerimaan) =>
                          ItemPenerimaan(penerimaan: penerimaan),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
                color: Colors.grey[100],
                padding: EdgeInsets.only(left: 10, right: 10),
                child: penerimaanResponse != null
                    ? ListView.builder(
                        itemCount: penerimaanResponse.data.penerimaan.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ItemPenerimaan(
                              penerimaan:
                                  penerimaanResponse.data.penerimaan[index]);
                        })
                    : Container()));
      },
      presenter: PenerimaanPresenter(
          PenerimaanViewModel(), this, PenerimaanPage.RiwayatPenerimaan, null),
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
  void showRiwayatPenerimaan(PenerimaanResponse penerimaanResponse) {
    setState(() {
      this.penerimaanResponse = penerimaanResponse;
    });
  }

  @override
  void showDetailRiwayatPenerimaan(
      PenerimaanDetailResponse penerimaanDetailResponse) {}

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
