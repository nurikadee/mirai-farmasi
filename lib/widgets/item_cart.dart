import 'package:flutter/material.dart';
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
  TextEditingController diskonPersenController = TextEditingController();

  Barang obat = Barang();
  bool inACart = false;

  @override
  void initState() {
    super.initState();
    obat = widget.obat;
    inACart = FarmasiStorage.checkBarangOnCart(obat);
  }

  @override
  Widget build(BuildContext context) {
    jumlahKemasanController.text = obat.jumlahKemasan.toString();
    diskonPersenController.text = obat.diskonPersen.toString();

    var subtotal = double.parse(obat.hargaKemasan) * obat.jumlahKemasan;
    var jumlahtotal = obat.jumlahKemasan * obat.isiPerKemasan;
    var diskonRp = obat.diskonPersen * subtotal / 100;

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
    MoneyFormatterOutput foDiskonRp =
        MoneyFormatter(amount: diskonRp, settings: formatter).output;

    return obat == null
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
                        child: Text("${obat.kodeBarang} - ${obat.namaBarang}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
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
                                    fontSize: 12, fontWeight: FontWeight.bold)),
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
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -2),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              title: Text("Subtotal (sebelum diskon)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("(Rp) : ${foSubtotal.nonSymbol}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                            ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -2),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              title: Text("Keterangan Diskon",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  "Diskon  %: ${obat.diskonPersen} \nDiskon (Rp) : ${foDiskonRp.nonSymbol}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(height: 20),
                            Form(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Text("Jumlah kemasan",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10)),
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
                                          controller: jumlahKemasanController,
                                          keyboardType: TextInputType.number,
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
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      title: Text("Diskon (%)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
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
                                            controller: diskonPersenController,
                                            keyboardType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              hintText: "0",
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        obat.jumlahKemasan = int.parse(
                                            jumlahKemasanController.text != null
                                                ? jumlahKemasanController.text
                                                : 0);
                                        obat.diskonPersen = int.parse(
                                            diskonPersenController.text != null
                                                ? diskonPersenController.text
                                                : 0);
                                      });
                                    },
                                    child: Container(
                                        width: 60,
                                        height: 50,
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("Update",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        )),
                                  ),
                                  SizedBox(width: 3),
                                  InkWell(
                                    onTap: () {
                                      FarmasiStorage.removeToCart(obat);
                                      return widget.callback();
                                    },
                                    child: Container(
                                        width: 60,
                                        height: 50,
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("Delete",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ),
            ),
          );
  }
}
