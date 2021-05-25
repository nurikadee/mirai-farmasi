import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/request/pesanan_request.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:medis/model/response/pengadaan_detail_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:medis/utilities/utils.dart';
import 'package:medis/view/pesanan/detail_pesanan.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:medis/widgets/item_cart.dart';
import 'package:medis/widgets/widget_rounded_input_field.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';
import 'dart:developer' as developer;

class Pesanan extends StatefulWidget {
  Pesanan({Key key}) : super(key: key);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesanan> with PesananViewInterface {
  DataObat dataCart;
  SupplierResponse supplierResponse;
  bool citoValue = false;

  final FocusNode focusNodeNoSP = FocusNode();
  final FocusNode focusNodeTanggalSP = FocusNode();
  final FocusNode focusNodeCatatan = FocusNode();

  TextEditingController noSPController = TextEditingController();
  TextEditingController tanggalSPController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  List<String> tipePembelian = [
    "REGULER",
    "E-KATALOG E-PURCHASING",
    "E-KATALOG"
  ];
  String tipeSelected = "REGULER";
  List<Supplier> listSupplier = [];
  Supplier supplierSelected;

  @override
  void initState() {
    super.initState();

    this.dataCart = FarmasiStorage.getCartStorage();
  }

  callback() {
    setState(() {
      this.dataCart = FarmasiStorage.getCartStorage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MVVMPage<PesananPresenter, PesananViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Buat Pesanan"),
            ),
            body: dataCart != null
                ? Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          child: ListTile(
                            title: Container(
                                width: MediaQuery.of(this.context).size.width *
                                    0.9,
                                child: Text("No Surat Pesanan",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            subtitle: RoundedInputField(
                                focusNode: focusNodeNoSP,
                                textEditingController: noSPController,
                                icon: FontAwesomeIcons.barcode,
                                cursorColor: Colors.black,
                                editTextBackgroundColor: Colors.grey[50],
                                iconColor: Colors.grey[500],
                                textInput: TextInputType.text,
                                hintText: "No Surat Pesanan",
                                textStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                readOnly: false),
                          ),
                        ),
                        Container(
                          child: ListTile(
                            trailing: InkWell(
                              child: Container(
                                  height: double.infinity,
                                  child: Icon(Icons.date_range)),
                              onTap: () => showTanggal(),
                            ),
                            title: Container(
                                width: MediaQuery.of(this.context).size.width *
                                    0.9,
                                child: Text("Tanggal Surat Pesanan",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            subtitle: RoundedInputField(
                                focusNode: focusNodeTanggalSP,
                                textEditingController: tanggalSPController,
                                icon: FontAwesomeIcons.calendar,
                                cursorColor: Colors.black,
                                editTextBackgroundColor: Colors.grey[50],
                                iconColor: Colors.grey[500],
                                textInput: TextInputType.text,
                                hintText: "Tanggal Surat Pesanan",
                                textStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                readOnly: true),
                          ),
                        ),
                        supplierResponse != null
                            ? Container(
                                child: ListTile(
                                  title: Container(
                                      width: MediaQuery.of(this.context)
                                              .size
                                              .width *
                                          0.9,
                                      child: Text("Distributor",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),
                                  subtitle: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width:
                                        MediaQuery.of(this.context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius:
                                            BorderRadius.circular(29)),
                                    child: Center(
                                      child: DropdownButton<Supplier>(
                                        isExpanded: true,
                                        value: supplierSelected,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 30,
                                        style: TextStyle(color: Colors.black),
                                        underline: SizedBox(),
                                        onChanged: (Supplier data) {
                                          setState(() {
                                            supplierSelected = data;
                                          });
                                        },
                                        items: listSupplier
                                            .map<DropdownMenuItem<Supplier>>(
                                                (Supplier value) {
                                          return DropdownMenuItem<Supplier>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(value.namaSupplier),
                                              ));
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        Container(
                          child: ListTile(
                            title: Container(
                                width: MediaQuery.of(this.context).size.width *
                                    0.9,
                                child: Text("Tipe Pembelian",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            subtitle: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: MediaQuery.of(this.context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(29)),
                              child: Center(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: tipeSelected,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  style: TextStyle(color: Colors.black),
                                  underline: SizedBox(),
                                  onChanged: (String data) {
                                    setState(() {
                                      tipeSelected = data;
                                    });
                                  },
                                  items: tipePembelian
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(value),
                                        ));
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ListTile(
                            title: Container(
                                width: MediaQuery.of(this.context).size.width *
                                    0.9,
                                child: Text("Catatan",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            subtitle: RoundedInputField(
                                focusNode: focusNodeCatatan,
                                textEditingController: catatanController,
                                icon: FontAwesomeIcons.stickyNote,
                                cursorColor: Colors.black,
                                editTextBackgroundColor: Colors.grey[50],
                                iconColor: Colors.grey[500],
                                textInput: TextInputType.text,
                                hintText: "Catatan",
                                textStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                readOnly: false),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.red[50],
                          title: Container(
                              width:
                                  MediaQuery.of(this.context).size.width * 0.9,
                              child: Text("CITO",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          trailing: CupertinoSwitch(
                            value: citoValue,
                            onChanged: (value) {
                              setState(() {
                                citoValue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text("List Pesanan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataCart.barang.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return ItemCart(
                                  obat: dataCart.barang[index],
                                  callback: callback);
                            }),
                        InkWell(
                          onTap: () {
                            developer.log("${dataCart.toJson().toString()}");
                            FarmasiStorage.addAllToCart(dataCart);

                            PesananRequest pesananRequest = PesananRequest();
                            pesananRequest.idSupplier =
                                supplierSelected.idSupplier;
                            pesananRequest.namaSupplier =
                                supplierSelected.namaSupplier;
                            pesananRequest.tipePembelian = tipeSelected;
                            pesananRequest.noSp = noSPController.text;
                            pesananRequest.tglSp = tanggalSPController.text;
                            pesananRequest.catatan =
                                catatanController.text == null
                                    ? ""
                                    : catatanController.text;
                            pesananRequest.isCito = citoValue;

                            if (noSPController.text == "") {
                              showMessage(
                                  "Nomor Pemesanan tidak boleh kosong", true);
                              return false;
                            }

                            if (tanggalSPController.text == "") {
                              showMessage(
                                  "Tanggal Pemesanan tidak boleh kosong", true);
                              return false;
                            }

                            Navigator.push(
                                this.context,
                                MaterialPageRoute(
                                  builder: (ctx) => PesananDetail(
                                      pesananRequest: pesananRequest),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            width: MediaQuery.of(this.context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("LANJUTKAN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Center(
                        child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Anda belum input data obat yang akan dipesan, " +
                              "harap lakukan tambah pesanan kedalam keranjang pesanan " +
                              "terlebih dahulu untuk memulai transaksi ini.",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ))));
      },
      presenter:
          PesananPresenter(PesananViewModel(), this, PesananPage.Pesanan, null),
    );
  }

  void showTanggal() {
    var initialDate = DateTime.now();
    var startDate = DateTime(DateTime.now().year, DateTime.now().month);

    showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: startDate,
        lastDate: DateTime(DateTime.now().year + 10, 12),
        builder: (BuildContext context, Widget picker) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.green[900],
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.green[400],
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        tanggalSPController.text =
            Utils.getDateOnlyFormat(selectedDate.toString());
      }
    });
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
  void showSupplier(SupplierResponse supplierResponse) {
    setState(() {
      this.supplierResponse = supplierResponse;
      this.listSupplier = supplierResponse.data.supplier;
      this.supplierSelected = listSupplier.first;

      FarmasiStorage.saveSupplierToStorage(supplierResponse);
    });
  }

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
