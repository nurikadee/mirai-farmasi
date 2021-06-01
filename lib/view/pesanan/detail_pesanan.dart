import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/request/pesanan_request.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/model/response/pengadaan_detail_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:medis/view/pesanan/thankyou.dart';
import 'package:medis/widgets/item_cart_no_action.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class PesananDetail extends StatefulWidget {
  final PesananRequest pesananRequest;

  PesananDetail({Key key, this.pesananRequest}) : super(key: key);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<PesananDetail> with PesananViewInterface {
  DataUser dataUser;
  UserFarmasiResponse userFarmasiResponse;
  PesananRequest pesananRequest;
  DataObat dataCart;

  List<UserFarmasi> listUser = [];
  UserFarmasi kepalaFarmasiSelected;
  UserFarmasi ppkSelected;
  bool ppnValue = false;

  MoneyFormatterSettings formatter = MoneyFormatterSettings();

  double total = 0.0;
  MoneyFormatterOutput foTotal;
  double ppn = 0.0;
  MoneyFormatterOutput foPpn;
  double subtotal = 0.0;
  MoneyFormatterOutput foSubtotal;

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();

    this.pesananRequest = widget.pesananRequest;
    this.dataCart = FarmasiStorage.getCartStorage();

    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";

    updateDetailHarga();
  }

  void checkIsLoggedIn() {
    Pref.checkIsLoggedIn().then((seen) {
      Pref.getUserLogin().then((value) {
        dataUser = value;
      });
    });
  }

  updateDetailHarga() {
    total = 0.0;
    for (Barang obat in dataCart.barang) {
      var s = double.parse(obat.hargaKemasan) * obat.jumlahKemasan;
      total = total + s;
    }

    foTotal = MoneyFormatter(amount: total, settings: formatter).output;

    ppn = ppnValue ? 0.0 : 10 * total / 100;
    foPpn = MoneyFormatter(amount: ppn, settings: formatter).output;

    subtotal = total + ppn;
    foSubtotal = MoneyFormatter(amount: subtotal, settings: formatter).output;
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
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5)),
                    child: RichText(
                      text: TextSpan(
                        text: 'No Surat Pesanan : ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: pesananRequest.noSp,
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                        text: 'Tanggal Surat Pesanan : ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: pesananRequest.tglSp,
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: pesananRequest.tipePembelian,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: RichText(
                      text: TextSpan(
                        text: 'Nama Distributor : ',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: pesananRequest.namaSupplier,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color:
                            pesananRequest.isCito ? Colors.red : Colors.green,
                        border: Border.all(
                            color: pesananRequest.isCito
                                ? Colors.red
                                : Colors.green),
                        borderRadius: BorderRadius.circular(5)),
                    child: RichText(
                      text: TextSpan(
                        text: 'CITO : ',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: pesananRequest.isCito ? "YA" : "TIDAK",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
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
                          Text("TOTAL HARGA: ", style: TextStyle(fontSize: 14)),
                          Expanded(
                            child: Text("(Rp) : ${foTotal.nonSymbol}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                          Text("SUBTOTAL : ", style: TextStyle(fontSize: 14)),
                          Expanded(
                            child: Text("(Rp) : ${foSubtotal.nonSymbol}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                  Container(
                    child: ListTile(
                      dense: true,
                      title: Container(
                          width: MediaQuery.of(this.context).size.width,
                          child: Text("Harga Sudah Termasuk PPN (10%)",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                      trailing: Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: ppnValue,
                            onChanged: (value) {
                              setState(() {
                                ppnValue = value;
                                updateDetailHarga();
                              });
                            },
                          )),
                    ),
                  ),
                  userFarmasiResponse != null
                      ? Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Text("Apoteker Pj : ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black))),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: DropdownButton<UserFarmasi>(
                                        isExpanded: true,
                                        value: kepalaFarmasiSelected,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 30,
                                        style: TextStyle(color: Colors.black),
                                        underline: SizedBox(),
                                        onChanged: (UserFarmasi data) {
                                          setState(() {
                                            kepalaFarmasiSelected = data;
                                          });
                                        },
                                        items: listUser
                                            .map<DropdownMenuItem<UserFarmasi>>(
                                                (UserFarmasi value) {
                                          return DropdownMenuItem<UserFarmasi>(
                                              value: value,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5.0,
                                                    bottom: 5.0,
                                                    left: 10.0,
                                                    right: 10.0),
                                                child: user(value),
                                              ));
                                        }).toList(),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : Container(),
                  userFarmasiResponse != null
                      ? Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Text("PPK : ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black))),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: DropdownButton<UserFarmasi>(
                                        isExpanded: true,
                                        value: ppkSelected,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 30,
                                        style: TextStyle(color: Colors.black),
                                        underline: SizedBox(),
                                        onChanged: (UserFarmasi data) {
                                          setState(() {
                                            ppkSelected = data;
                                          });
                                        },
                                        items: listUser
                                            .map<DropdownMenuItem<UserFarmasi>>(
                                                (UserFarmasi value) {
                                          return DropdownMenuItem<UserFarmasi>(
                                              value: value, child: user(value));
                                        }).toList(),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text("List Pesanan",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataCart.barang.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ItemCartNoAction(obat: dataCart.barang[index]);
                      }),
                  InkWell(
                    onTap: () {
                      pesananRequest.createdBy = dataUser.pegawai.pegawaiId;
                      pesananRequest.idApj = kepalaFarmasiSelected.pegawaiId;
                      pesananRequest.idPptk = ppkSelected.pegawaiId;
                      pesananRequest.total = subtotal.toInt();
                      pesananRequest.totalSebelumDiskon = total.toInt();
                      pesananRequest.totalSetelahDiskon = total.toInt();
                      pesananRequest.totalPpn = ppn.toInt();
                      pesananRequest.totalDiskon = 0;
                      pesananRequest.jenis = "NORMAL";
                      pesananRequest.isPpn = ppnValue;

                      List<BarangPesanan> listBarang = [];

                      for (Barang barang in dataCart.barang) {
                        BarangPesanan barangReq = BarangPesanan();

                        double sub = (barang.jumlahKemasan *
                            double.parse(barang.hargaKemasan));

                        barangReq.idBarang = barang.idBarang;
                        barangReq.jumlahKemasan = barang.jumlahKemasan;
                        barangReq.idKemasan = barang.idKemasan;
                        barangReq.hargaKemasan =
                            double.parse(barang.hargaKemasan).toInt();
                        barangReq.isiPerKemasan = barang.isiPerKemasan;
                        barangReq.jumlahTotal = barang.jumlahKemasan;
                        barangReq.idSatuan = barang.idSatuan;
                        barangReq.hargaSatuan =
                            double.parse(barang.hargaSatuanTerakhir).toInt();
                        barangReq.subtotal = sub.toInt();
                        barangReq.diskonPersen = 0;
                        barangReq.diskonTotal = 0;
                        barangReq.isPpn = ppnValue;
                        barangReq.hargaBeliSekarang =
                            double.parse(barang.hargaSatuanTerakhir).toInt();
                        barangReq.hargaBeliTertinggi =
                            double.parse(barang.hargaSatuanTertinggi).toInt();
                        barangReq.keterangan = barang.keterangan;
                        barangReq.jumlahDiterima = 0;

                        listBarang.add(barangReq);
                      }
                      pesananRequest.barang = listBarang;

                      developer.log("${jsonEncode(pesananRequest)}",
                          name: "Reuqest");

                      presenter.addPesanan(pesananRequest);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: MediaQuery.of(this.context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("PESAN SEKARANG",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
      presenter: PesananPresenter(
          PesananViewModel(), this, PesananPage.DetailPesanan, null),
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
  void showUserFarmasi(UserFarmasiResponse userFarmasiResponse) {
    setState(() {
      this.userFarmasiResponse = userFarmasiResponse;
      this.listUser = userFarmasiResponse.data.anggotaInstalasi;

      if (!checkPJ()) {
        listUser.add(userFarmasiResponse.data.kepalaInstalasi);
        checkPJ();
      }

      if (!checkPPK()) {
        listUser.add(userFarmasiResponse.data.ppk);
        checkPPK();
      }
    });
  }

  @override
  void afterAddPesanan(AddPesananResponse addPesananResponse) {
    if (addPesananResponse.status == 200) {
      FarmasiStorage.clearCartStorage();

      Navigator.push(
          this.context,
          MaterialPageRoute(
            builder: (ctx) => ThankYou(addPesananResponse: addPesananResponse),
          ));
    } else {
      showMessage(addPesananResponse.message, true);
    }
  }

  @override
  void showRiwayatPesanan(PengadaanResponse pengadaanResponse) {}

  @override
  void showDetailRiwayatPesanan(
      PengadaanDetailResponse pengadaanDetailResponse) {}

  Widget user(UserFarmasi value) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      child: Text(
        "${value.gelarSarjanaDepan} ${value.namaLengkap} ${value.gelarSarjanaBelakang}",
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  bool checkPJ() {
    for (UserFarmasi user in listUser) {
      if (user.pegawaiId ==
          userFarmasiResponse.data.kepalaInstalasi.pegawaiId) {
        this.kepalaFarmasiSelected = user;
        return true;
      }
    }
    return false;
  }

  bool checkPPK() {
    for (UserFarmasi user in listUser) {
      if (user.pegawaiId == userFarmasiResponse.data.ppk.pegawaiId) {
        this.ppkSelected = user;
        return true;
      }
    }

    return false;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
