import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:medis/model/response/penerimaan_response.dart';
import 'package:medis/utilities/utils.dart';
import 'package:medis/view/penerimaan/detail_riwayat_penerimaan.dart';

class ItemPenerimaan extends StatefulWidget {
  final Penerimaan penerimaan;

  ItemPenerimaan({this.penerimaan});

  @override
  _ItemPenerimaanState createState() => _ItemPenerimaanState();
}

class _ItemPenerimaanState extends State<ItemPenerimaan>
    with LifecycleAware, LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return widget.penerimaan == null
        ? Container()
        : InkWell(
            onTap: () {
              Navigator.push(
                  this.context,
                  MaterialPageRoute(
                    builder: (ctx) => RiwayatPenerimaanDetail(
                        idPenerimaan: widget.penerimaan.idPenerimaan),
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
                        child: Text("${widget.penerimaan.noPenerimaan}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                    trailing: Text(
                      "${widget.penerimaan.tipePembelian != null ? widget.penerimaan.tipePembelian : ''}",
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
                              "Tanggal Penerimaan : ${Utils.getDateFormat(widget.penerimaan.tglPenerimaan)} ",
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
