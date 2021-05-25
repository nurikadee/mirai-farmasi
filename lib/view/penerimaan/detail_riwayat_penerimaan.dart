import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/model/response/penerimaan_detail_response.dart';
import 'package:medis/model/response/penerimaan_response.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_presenter.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_interface.dart';
import 'package:medis/view/penerimaan/pattern/penerimaan_view_model.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class RiwayatPenerimaanDetail extends StatefulWidget {
  final int idPenerimaan;

  RiwayatPenerimaanDetail({Key key, this.idPenerimaan}) : super(key: key);

  @override
  _PenerimaanState createState() => _PenerimaanState();
}

class _PenerimaanState extends State<RiwayatPenerimaanDetail>
    with PenerimaanViewInterface {
  DataUser dataUser;
  PenerimaanDetailResponse penerimaanDetailResponse;
  Penerimaan penerimaan;
  List<PenerimaanDetail> listPenerimaanDetail;
  int idPenerimaan;

  MoneyFormatterSettings formatter = MoneyFormatterSettings();

  MoneyFormatterOutput foTotalSebelumDiskon;
  MoneyFormatterOutput foTotalDiskon;
  MoneyFormatterOutput foTotalSetelahDiskon;
  MoneyFormatterOutput foPpn;
  MoneyFormatterOutput foSubtotal;

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();

    idPenerimaan = widget.idPenerimaan;

    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";
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
              title: Text("Detail Penerimaan"),
            ),
            body: penerimaanDetailResponse != null
                ? Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                            text: TextSpan(
                              text: 'No Surat Penerimaan : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: penerimaan.noPenerimaan,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                            text: TextSpan(
                              text: 'Tanggal Surat Penerimaan : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: penerimaan.tglPenerimaan,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                            text: TextSpan(
                              text: 'Tipe Pembelian : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: penerimaan.tipePembelian,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Text("TOTAL HARGA: ",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(
                                  child: Text(
                                      "(Rp) : ${foTotalSebelumDiskon.nonSymbol}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Text("TOTAL PPN (10%) : ",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(
                                  child: Text("(Rp) : ${foPpn.nonSymbol}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Text("TOTAL DISKON : ",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(
                                  child: Text(
                                      "(Rp) : ${foTotalDiskon.nonSymbol}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Text("SUBTOTAL : ",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(
                                  child: Text("(Rp) : ${foSubtotal.nonSymbol}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )),
                        penerimaan.isPpn
                            ? Container(
                                child: ListTile(
                                  title: Container(
                                      width: MediaQuery.of(this.context)
                                          .size
                                          .width,
                                      child: Text(
                                          "* Harga Sudah Termasuk PPN (10%)",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold))),
                                ),
                              )
                            : Container(
                                height: 20,
                              ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text("List Penerimaan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listPenerimaanDetail.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              var penerimaanDetail =
                                  listPenerimaanDetail[index];
                              return Card(
                                elevation: 0.5,
                                child: ListTile(
                                  title: Text(
                                    "${index + 1}# - ${penerimaanDetail.barang.namaBarang}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                      "${double.parse(penerimaanDetail.jumlahTotal).toInt()} ${penerimaanDetail.barang.namaKemasan}"),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                : Container());
      },
      presenter: PenerimaanPresenter(PenerimaanViewModel(), this,
          PenerimaanPage.DetailRiwayatPenerimaan, idPenerimaan),
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
  void showRiwayatPenerimaan(PenerimaanResponse penerimaanResponse) {}

  @override
  void showDetailRiwayatPenerimaan(
      PenerimaanDetailResponse penerimaanDetailResponse) {
    setState(() {
      this.penerimaanDetailResponse = penerimaanDetailResponse;
      this.penerimaan = penerimaanDetailResponse.data.penerimaan;
      this.listPenerimaanDetail =
          penerimaanDetailResponse.data.penerimaanDetail;

      foTotalSebelumDiskon = MoneyFormatter(
              amount: double.parse(penerimaan.totalSebelumDiskon),
              settings: formatter)
          .output;

      foTotalSetelahDiskon = MoneyFormatter(
              amount: double.parse(penerimaan.totalSetelahDiskon),
              settings: formatter)
          .output;

      foTotalDiskon = MoneyFormatter(
              amount: double.parse(penerimaan.totalDiskon), settings: formatter)
          .output;

      foPpn = MoneyFormatter(
              amount: double.parse(penerimaan.totalPpn), settings: formatter)
          .output;

      foSubtotal = MoneyFormatter(
              amount: double.parse(penerimaan.totalSetelahDiskon),
              settings: formatter)
          .output;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
