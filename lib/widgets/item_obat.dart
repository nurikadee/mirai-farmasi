import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/response/obat_response.dart';
import 'package:money_formatter/money_formatter.dart';

class ItemObat extends StatefulWidget {
  final Function callback;
  final Barang obat;

  ItemObat({this.callback, this.obat});

  @override
  _ItemObatState createState() => _ItemObatState();
}

class _ItemObatState extends State<ItemObat> {
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
    MoneyFormatterSettings formatter = MoneyFormatterSettings();
    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";

    MoneyFormatterOutput foHargaSatuanTerakhir = MoneyFormatter(
            amount: double.parse(obat.hargaSatuanTerakhir), settings: formatter)
        .output;

    return obat == null
        ? Container()
        : InkWell(
            onTap: () {
              if (inACart) {
                FarmasiStorage.removeToCart(obat);
              } else {
                FarmasiStorage.addToCart(obat);
              }
              setState(() {
                inACart = FarmasiStorage.checkBarangOnCart(obat);
              });
              return widget.callback();
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                    dense: true,
                    trailing: Icon(
                        inACart
                            ? FontAwesomeIcons.check
                            : FontAwesomeIcons.plus,
                        size: 15,
                        color: inACart ? Colors.green[400] : Colors.blue),
                    leading: Icon(
                      FontAwesomeIcons.pills,
                      size: 25,
                      color: Colors.pink,
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
                        child: Text(
                            "${obat.namaJenis != null ? obat.namaJenis : ''} " +
                                "\n${obat.namaSubJenis != null ? obat.namaSubJenis : ''}" +
                                "\n\nHarga Satuan Terakhir : Rp. ${foHargaSatuanTerakhir.nonSymbol}",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)))),
              ),
            ),
          );
  }
}
