import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
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

class _ItemObatState extends State<ItemObat>
    with LifecycleAware, LifecycleMixin {
  bool inACart = false;

  @override
  void initState() {
    super.initState();
    inACart = FarmasiStorage.checkBarangOnCart(widget.obat);
  }

  @override
  Widget build(BuildContext context) {
    MoneyFormatterSettings formatter = MoneyFormatterSettings();
    formatter.decimalSeparator = ",";
    formatter.thousandSeparator = ".";

    MoneyFormatterOutput foHargaSatuanTerakhir = MoneyFormatter(
            amount: double.parse(widget.obat.hargaSatuanTerakhir),
            settings: formatter)
        .output;

    MoneyFormatterOutput foHargaKemasan = MoneyFormatter(
            amount: double.parse(widget.obat.hargaKemasan), settings: formatter)
        .output;

    return widget.obat == null
        ? Container()
        : InkWell(
            onTap: () {
              if (inACart) {
                FarmasiStorage.removeToCart(widget.obat);
              } else {
                FarmasiStorage.addToCart(widget.obat);
              }
              setState(() {
                inACart = FarmasiStorage.checkBarangOnCart(widget.obat);
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
                        child: Text(
                            "${widget.obat.kodeBarang} - ${widget.obat.namaBarang}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                    subtitle: Transform(
                        transform: Matrix4.translationValues(-16, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                              "${widget.obat.namaJenis != null ? widget.obat.namaJenis : ''} " +
                                  "\n${widget.obat.namaSubJenis != null ? widget.obat.namaSubJenis : ''}" +
                                  "\n\nKemasan : ${widget.obat.namaKemasan.toUpperCase()}" +
                                  "\nHarga Kemasan : Rp. ${foHargaKemasan.nonSymbol}" +
                                  "\nHarga Satuan Terakhir : Rp. ${foHargaSatuanTerakhir.nonSymbol}",
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ))),
              ),
            ),
          );
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    if (event == LifecycleEvent.active) {
      inACart = FarmasiStorage.checkBarangOnCart(widget.obat);
    }
  }
}
