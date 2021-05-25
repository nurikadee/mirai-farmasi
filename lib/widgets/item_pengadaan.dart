import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:medis/model/response/pengadaan_response.dart';
import 'package:medis/utilities/utils.dart';
import 'package:medis/view/pesanan/detail_riwayat_pesanan.dart';

class ItemPengadaan extends StatefulWidget {
  final Pengadaan pengadaan;

  ItemPengadaan({this.pengadaan});

  @override
  _ItemPengadaanState createState() => _ItemPengadaanState();
}

class _ItemPengadaanState extends State<ItemPengadaan>
    with LifecycleAware, LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return widget.pengadaan == null
        ? Container()
        : InkWell(
            onTap: () {
              Navigator.push(
                  this.context,
                  MaterialPageRoute(
                    builder: (ctx) => RiwayatPesananDetail(
                        idPesanan: widget.pengadaan.idPengadaan),
                  ));
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.shopping_bag,
                      size: 25,
                      color: Colors.pink,
                    ),
                    title: Transform(
                        transform: Matrix4.translationValues(-16, 0.0, 0.0),
                        child: Text("${widget.pengadaan.noSp}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                    trailing: Text(
                      "${widget.pengadaan.tipePembelian != null ? widget.pengadaan.tipePembelian : ''}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Transform(
                        transform: Matrix4.translationValues(-16, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                              "Tanggal Pesanan : ${Utils.getDateFormat(widget.pengadaan.tglSp)} ",
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
    if (event == LifecycleEvent.active) {}
  }
}
