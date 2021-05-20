import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:money_formatter/money_formatter.dart';

class ItemCartNoAction extends StatefulWidget {
  final Function callback;
  final Barang obat;

  ItemCartNoAction({this.obat, this.callback});

  @override
  _ItemObatState createState() => _ItemObatState();
}

class _ItemObatState extends State<ItemCartNoAction> {
  Barang obat = Barang();

  @override
  void initState() {
    super.initState();
    obat = widget.obat;
  }

  @override
  Widget build(BuildContext context) {
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

    return obat == null
        ? Container()
        : InkWell(
            onTap: () {},
            child: Card(
              color: Colors.amber[50],
              elevation: 0.5,
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
                              title: Text("Keterangan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("${obat.keterangan}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ))),
              ),
            ),
          );
  }
}
