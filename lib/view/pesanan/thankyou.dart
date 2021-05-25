import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/pengadaan_detail_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:medis/view/home/bottombar.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class ThankYou extends StatefulWidget {
  final AddPesananResponse addPesananResponse;

  ThankYou({Key key, this.addPesananResponse}) : super(key: key);

  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> with PesananViewInterface {
  AddPesananResponse addPesananResponse;
  List<PengadaanDetail> listPesanan = [];
  MoneyFormatterSettings formatter = MoneyFormatterSettings();
  MoneyFormatterOutput foTotalBeforePpn;
  MoneyFormatterOutput foTotal;
  MoneyFormatterOutput foPpn;
  double totalBeforePpn = 0;

  @override
  void initState() {
    this.addPesananResponse = widget.addPesananResponse;
    this.listPesanan = addPesananResponse.data.pengadaanDetail;

    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";

    totalBeforePpn = double.parse(addPesananResponse.data.pengadaan.total) -
        double.parse(addPesananResponse.data.pengadaan.totalPpn);

    foTotalBeforePpn =
        MoneyFormatter(amount: totalBeforePpn, settings: formatter).output;

    foTotal = MoneyFormatter(
            amount: double.parse(addPesananResponse.data.pengadaan.total),
            settings: formatter)
        .output;

    foPpn = MoneyFormatter(
            amount: double.parse(addPesananResponse.data.pengadaan.totalPpn),
            settings: formatter)
        .output;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MVVMPage<PesananPresenter, PesananViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("${addPesananResponse.message}"),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(this.context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => BottomBar()),
                          (Route<dynamic> route) => false);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text("Pesanan telah dikirim",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Container(
                    padding:
                        EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Nomor Pesanan : ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: addPesananResponse.data.pengadaan.noSp,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Tanggal Pesanan : ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: addPesananResponse.data.pengadaan.tglSp,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding:
                        EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
                    child: Text(
                      "Detail Pesanan :",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Divider(height: 1, color: Colors.black)),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(2),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listPesanan.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return item(ctxt, listPesanan[index]);
                        }),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Divider(height: 1, color: Colors.black)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(this.context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Total",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black)),
                        ),
                        Expanded(
                          child: Text("(Rp) : ${foTotalBeforePpn.nonSymbol}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(this.context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("PPN (10%)",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black)),
                        ),
                        Expanded(
                          child: Text("(Rp) : ${foPpn.nonSymbol}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Divider(height: 1, color: Colors.black)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(this.context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Subtotal",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black)),
                        ),
                        Expanded(
                          child: Text("(Rp) : ${foTotal.nonSymbol}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(this.context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => BottomBar()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: MediaQuery.of(this.context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("KEMBALI KE HALAMAN UTAMA",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
      presenter: PesananPresenter(
          PesananViewModel(), this, PesananPage.ThankYou, null),
    );
  }

  Widget item(BuildContext ctxt, PengadaanDetail pengadaanDetail) {
    var jumlahKemasan = double.parse(pengadaanDetail.jumlahKemasan).toInt();
    var hargaKemasan = double.parse(pengadaanDetail.barang.hargaKemasan);

    var total = jumlahKemasan * hargaKemasan;
    MoneyFormatterOutput foHargaTotal =
        MoneyFormatter(amount: total, settings: formatter).output;

    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: '$jumlahKemasan ',
                style: TextStyle(fontSize: 12, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: "${pengadaanDetail.barang.namaKemasan} - ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black)),
                  TextSpan(
                      text: "${pengadaanDetail.barang.namaBarang}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("(Rp) : ${foHargaTotal.nonSymbol}",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.blue)),
          ),
        ],
      ),
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
  void showRiwayatPesanan(PengadaanResponse pengadaanResponse) {}

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
