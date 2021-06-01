import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:money_formatter/money_formatter.dart';

class ItemCart extends StatefulWidget {
  final Function callback;
  final Barang obat;

  ItemCart({this.obat, this.callback});

  @override
  _ItemObatState createState() => _ItemObatState();
}

class _ItemObatState extends State<ItemCart> {
  final FocusNode fnJumlahKemasan = FocusNode();
  final FocusNode fnDiskonPersen = FocusNode();

  TextEditingController jumlahKemasanController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  Barang obat = Barang();
  bool inACart = false;

  @override
  void initState() {
    super.initState();
    obat = widget.obat;
    inACart = FarmasiStorage.checkBarangOnCart(obat);

    fnJumlahKemasan.addListener(() {
      if (fnJumlahKemasan.hasFocus) {
        if (obat.jumlahKemasan == 0) {
          jumlahKemasanController.clear();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (obat.jumlahKemasan != null || obat.jumlahKemasan != 0) {
      jumlahKemasanController.text = obat.jumlahKemasan.toString();
    }
    if (obat.keterangan != null) {
      keteranganController.text = obat.keterangan.toString();
    }

    var subtotal = double.parse(obat.hargaKemasan) * obat.jumlahKemasan;
    var jumlahtotal = obat.jumlahKemasan * obat.isiPerKemasan;

    MoneyFormatterSettings formatter = MoneyFormatterSettings();
    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";

    MoneyFormatterOutput foSubtotal =
        MoneyFormatter(amount: subtotal, settings: formatter).output;
    MoneyFormatterOutput foHargaKemasan = MoneyFormatter(
            amount: double.parse(obat.hargaKemasan), settings: formatter)
        .output;
    MoneyFormatterOutput foHargaSatuan = MoneyFormatter(
            amount: double.parse(obat.hargaSatuanTerakhir), settings: formatter)
        .output;

    return Dismissible(
        key: Key(obat.idBarang.toString()),
        onDismissed: (direction) {
          FarmasiStorage.removeToCart(obat);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${obat.kodeBarang.toString()} telah dihapus")));
        },
        child: obat == null
            ? Container()
            : InkWell(
                onTap: () {},
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          FontAwesomeIcons.pills,
                          size: 25,
                          color: Colors.blue,
                        ),
                        title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                                "${obat.kodeBarang} - ${obat.namaBarang}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                        subtitle: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(obat.namaJenis,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -2),
                                        contentPadding: EdgeInsets.zero,
                                        dense: true,
                                        title: Text("Keterangan Kemasan",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                            "Jumlah : ${obat.jumlahKemasan} \nKemasan : ${obat.namaKemasan} \nHarga : ${foHargaKemasan.nonSymbol}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -2),
                                        contentPadding: EdgeInsets.zero,
                                        dense: true,
                                        title: Text("Keterangan Satuan",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                            "Isi Per Kemasan : ${obat.isiPerKemasan} \nJumlah Total : $jumlahtotal \nSatuan : pcs \nHarga : ${foHargaSatuan.nonSymbol}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -2),
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  title: Text("Subtotal (sebelum diskon)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      "(Rp) : ${foSubtotal.nonSymbol}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal)),
                                ),
                                ListTile(
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -2),
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  title: Text("Keterangan",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("${obat.keterangan}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(height: 20),
                                Form(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0),
                                              child: Text("Jumlah",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10)),
                                            ),
                                            subtitle: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  focusNode: fnJumlahKemasan,
                                                  controller:
                                                      jumlahKemasanController,
                                                  keyboardType: TextInputType
                                                      .numberWithOptions(
                                                          signed: true,
                                                          decimal: false),
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  onEditingComplete: () {
                                                    setState(() {
                                                      obat.jumlahKemasan = int.parse(
                                                          jumlahKemasanController
                                                                      .text !=
                                                                  null
                                                              ? jumlahKemasanController
                                                                  .text
                                                              : 0);
                                                    });
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            FocusNode());
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: "0",
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                )),
                                          )),
                                      SizedBox(width: 3),
                                      Expanded(
                                        flex: 3,
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          dense: true,
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0),
                                            child: Text("Keterangan",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10)),
                                          ),
                                          subtitle: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: TextFormField(
                                                focusNode: fnDiskonPersen,
                                                textAlign: TextAlign.center,
                                                controller:
                                                    keteranganController,
                                                keyboardType: TextInputType
                                                    .numberWithOptions(
                                                        signed: true,
                                                        decimal: false),
                                                textInputAction:
                                                    TextInputAction.done,
                                                onEditingComplete: () {
                                                  setState(() {
                                                    obat.keterangan =
                                                        keteranganController
                                                                    .text !=
                                                                null
                                                            ? keteranganController
                                                                .text
                                                            : "";
                                                  });
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Keterangan",
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))),
                  ),
                ),
              ));
  }
}
