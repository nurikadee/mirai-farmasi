import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/model/response/add_pesanan_response.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/model/response/pengadaan_detail_response.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/model/response/supplier_response.dart';
import 'package:medis/model/response/user_farmasi_response.dart';
import 'package:medis/utilities/utils.dart';
import 'package:medis/view/pesanan/pattern/pesanan_presenter.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_interface.dart';
import 'package:medis/view/pesanan/pattern/pesanan_view_model.dart';
import 'package:medis/widgets/item_terima_pesanan.dart';
import 'package:medis/widgets/widget_rounded_input_field.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:toast/toast.dart';

class RiwayatPesananDetail extends StatefulWidget {
  final int idPesanan;

  RiwayatPesananDetail({Key key, this.idPesanan}) : super(key: key);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<RiwayatPesananDetail>
    with PesananViewInterface {
  DataUser dataUser;
  PengadaanDetailResponse pengadaanDetailResponse;
  Pengadaan pengadaan;
  List<PengadaanDetail> listPengadaanDetail;
  int idPesanan;

  MoneyFormatterSettings formatter = MoneyFormatterSettings();

  MoneyFormatterOutput foTotalSebelumDiskon;
  MoneyFormatterOutput foTotalDiskon;
  MoneyFormatterOutput foTotalSetelahDiskon;
  MoneyFormatterOutput foPpn;
  MoneyFormatterOutput foSubtotal;

  final FocusNode focusNodeNoFaktur = FocusNode();
  final FocusNode focusNodeTanggalFaktur = FocusNode();
  final FocusNode focusNodeCatatan = FocusNode();
  final FocusNode focusNodeTanggalJatohTempo = FocusNode();

  TextEditingController noFakturController = TextEditingController();
  TextEditingController tanggalFakturController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController tanggalJatohTempoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();

    idPesanan = widget.idPesanan;

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
    return MVVMPage<PesananPresenter, PesananViewModel>(
      builder: (context, presenter, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Detail Pesanan"),
            ),
            body: pengadaanDetailResponse != null
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
                              text: 'No Surat Pesanan : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: pengadaan.noSp,
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
                              text: 'Tanggal Surat Pesanan : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: pengadaan.tglSp,
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
                                    text: pengadaan.tipePembelian,
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
                              border: Border.all(color: Colors.blue),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                            text: TextSpan(
                              text: 'Nama Distributor : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text: pengadaan.namaSupplier,
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
                                  pengadaan.isCito ? Colors.red : Colors.green,
                              border: Border.all(
                                  color: pengadaan.isCito
                                      ? Colors.red
                                      : Colors.green),
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                            text: TextSpan(
                              text: 'CITO : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text: pengadaan.isCito ? "YA" : "TIDAK",
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
                        pengadaan.isPpn
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
                          child: Text("List Pesanan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listPengadaanDetail.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              PengadaanDetail pengadaanDetail =
                                  listPengadaanDetail[index];
                              return ItemTerimaPesanan(
                                  pengadaanDetail: pengadaanDetail,
                                  index: index);
                            }),
                        InkWell(
                          onTap: () {
                            _showSheet();
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            width: MediaQuery.of(this.context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("TERIMA PESANAN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container());
      },
      presenter: PesananPresenter(PesananViewModel(), this,
          PesananPage.DetailRiwayatPesanan, idPesanan),
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

  void _showSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Kuitansi kuitansi = Kuitansi.faktur;
          Materai materai = Materai.tigaRibu;
          SumberDana sumberDana = SumberDana.BLUD;
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return DraggableScrollableSheet(
                expand: false,
                builder: (_, controller) {
                  return Container(
                    child: Form(
                      child: ListView(
                        controller: controller,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20.0),
                            color: Colors.pink,
                            child: Text(
                              'FORM PENERIMAAN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: RadioListTile(
                                  dense: true,
                                  value: Kuitansi.faktur,
                                  groupValue: kuitansi,
                                  onChanged: (Kuitansi value) {
                                    setState(() {
                                      kuitansi = value;
                                    });
                                  },
                                  title: Text('Faktur'),
                                ),
                              ),
                              Flexible(
                                child: RadioListTile(
                                  dense: true,
                                  value: Kuitansi.tandaTerima,
                                  groupValue: kuitansi,
                                  onChanged: (Kuitansi value) {
                                    setState(() {
                                      kuitansi = value;
                                    });
                                  },
                                  title: Text('Tanda Terima'),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: ListTile(
                              title: Container(
                                  width: MediaQuery.of(this.context).size.width,
                                  child: Text(
                                      "No ${kuitansi == Kuitansi.faktur ? 'Faktur' : 'Tanda Terima'}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              subtitle: RoundedInputField(
                                  focusNode: focusNodeNoFaktur,
                                  textEditingController: noFakturController,
                                  icon: FontAwesomeIcons.barcode,
                                  cursorColor: Colors.black,
                                  editTextBackgroundColor: Colors.grey[50],
                                  iconColor: Colors.grey[500],
                                  textInput: TextInputType.text,
                                  hintText:
                                      "No ${kuitansi == Kuitansi.faktur ? 'Faktur' : 'Tanda Terima'}",
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
                                  width:
                                      MediaQuery.of(this.context).size.width *
                                          0.9,
                                  child: Text(
                                      "Tanggal ${kuitansi == Kuitansi.faktur ? 'Faktur' : 'Tanda Terima'}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              subtitle: RoundedInputField(
                                  focusNode: focusNodeTanggalFaktur,
                                  textEditingController:
                                      tanggalFakturController,
                                  icon: FontAwesomeIcons.calendar,
                                  cursorColor: Colors.black,
                                  editTextBackgroundColor: Colors.grey[50],
                                  iconColor: Colors.grey[500],
                                  textInput: TextInputType.text,
                                  hintText:
                                      "Tanggal ${kuitansi == Kuitansi.faktur ? 'Faktur' : 'Tanda Terima'}",
                                  textStyle: TextStyle(
                                      fontSize: 14.0, color: Colors.black),
                                  readOnly: true),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              title: Container(
                                  width:
                                      MediaQuery.of(this.context).size.width *
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
                          Container(
                            child: ListTile(
                              title: Container(
                                  width:
                                      MediaQuery.of(this.context).size.width *
                                          0.9,
                                  child: Text("Materai",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              subtitle: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: RadioListTile(
                                      dense: true,
                                      value: Materai.tigaRibu,
                                      groupValue: materai,
                                      onChanged: (Materai value) {
                                        setState(() {
                                          materai = value;
                                        });
                                      },
                                      title: Text('6.000'),
                                    ),
                                  ),
                                  Flexible(
                                    child: RadioListTile(
                                      dense: true,
                                      value: Materai.enamRibu,
                                      groupValue: materai,
                                      onChanged: (Materai value) {
                                        setState(() {
                                          materai = value;
                                        });
                                      },
                                      title: Text('10.000'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              title: Container(
                                  width:
                                      MediaQuery.of(this.context).size.width *
                                          0.9,
                                  child: Text("Sumber Dana",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              subtitle: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: RadioListTile(
                                      dense: true,
                                      value: SumberDana.APBD,
                                      groupValue: sumberDana,
                                      onChanged: (SumberDana value) {
                                        setState(() {
                                          sumberDana = value;
                                        });
                                      },
                                      title: Text('APBD'),
                                    ),
                                  ),
                                  Flexible(
                                    child: RadioListTile(
                                      dense: true,
                                      value: SumberDana.BLUD,
                                      groupValue: sumberDana,
                                      onChanged: (SumberDana value) {
                                        setState(() {
                                          sumberDana = value;
                                        });
                                      },
                                      title: Text('BLUD'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              trailing: InkWell(
                                child: Container(
                                    height: double.infinity,
                                    child: Icon(Icons.date_range)),
                                onTap: () => showTanggalJatohTempo(),
                              ),
                              title: Container(
                                  width:
                                      MediaQuery.of(this.context).size.width *
                                          0.9,
                                  child: Text("Tanggal Jatuh Tempo",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              subtitle: RoundedInputField(
                                  focusNode: focusNodeTanggalJatohTempo,
                                  textEditingController:
                                      tanggalJatohTempoController,
                                  icon: FontAwesomeIcons.calendar,
                                  cursorColor: Colors.black,
                                  editTextBackgroundColor: Colors.grey[50],
                                  iconColor: Colors.grey[500],
                                  textInput: TextInputType.text,
                                  hintText: "Tanggal Jatuh Tempo",
                                  textStyle: TextStyle(
                                      fontSize: 14.0, color: Colors.black),
                                  readOnly: true),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(15),
                              width: MediaQuery.of(this.context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("BUAT PENERIMAAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        });
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
        tanggalFakturController.text =
            Utils.getDateOnlyFormat(selectedDate.toString());
      }
    });
  }

  void showTanggalJatohTempo() {
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
        tanggalJatohTempoController.text =
            Utils.getDateOnlyFormat(selectedDate.toString());
      }
    });
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
      PengadaanDetailResponse pengadaanDetailResponse) {
    setState(() {
      this.pengadaanDetailResponse = pengadaanDetailResponse;
      this.pengadaan = pengadaanDetailResponse.data.pengadaan;
      this.listPengadaanDetail = pengadaanDetailResponse.data.pengadaanDetail;

      foTotalSebelumDiskon = MoneyFormatter(
              amount: double.parse(pengadaan.totalSebelumDiskon),
              settings: formatter)
          .output;

      foTotalSetelahDiskon = MoneyFormatter(
              amount: double.parse(pengadaan.totalSetelahDiskon),
              settings: formatter)
          .output;

      foTotalDiskon = MoneyFormatter(
              amount: double.parse(pengadaan.totalDiskon), settings: formatter)
          .output;

      foPpn = MoneyFormatter(
              amount: double.parse(pengadaan.totalPpn), settings: formatter)
          .output;

      foSubtotal = MoneyFormatter(
              amount: double.parse(pengadaan.totalSetelahDiskon),
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

enum Kuitansi { faktur, tandaTerima }
enum Materai { tigaRibu, enamRibu }
enum SumberDana { APBD, BLUD }
