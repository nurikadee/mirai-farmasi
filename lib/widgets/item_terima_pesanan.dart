import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medis/model/request/penerimaan_request.dart';
import 'package:medis/model/response/add_pesanan_response.dart';

class ItemTerimaPesanan extends StatefulWidget {
  final PengadaanDetail pengadaanDetail;
  final int index;

  ItemTerimaPesanan({this.pengadaanDetail, this.index});

  @override
  _ItemTerimaPesananState createState() => _ItemTerimaPesananState();
}

class _ItemTerimaPesananState extends State<ItemTerimaPesanan> {
  BarangPenerimaan barangPenerimaan = BarangPenerimaan();
  PengadaanDetail pengadaanDetail;

  FocusNode fnJumlDiterima = FocusNode();
  TextEditingController jumlDiterima = TextEditingController();
  FocusNode fnExpiredDate = FocusNode();
  TextEditingController expiredDate = TextEditingController();

  @override
  void initState() {
    this.pengadaanDetail = widget.pengadaanDetail;

    this.barangPenerimaan.diskonPersen = pengadaanDetail.diskonPersen;
    this.barangPenerimaan.diskonTotal = pengadaanDetail.diskonTotal;
    this.barangPenerimaan.hargaBeliSekarang = pengadaanDetail.hargaBeliSekarang;
    this.barangPenerimaan.hargaBeliTertinggi =
        pengadaanDetail.hargaBeliTertinggi;
    this.barangPenerimaan.hargaKemasan = pengadaanDetail.hargaKemasan;
    this.barangPenerimaan.hargaSatuan = pengadaanDetail.hargaSatuan;
    this.barangPenerimaan.idBarang = pengadaanDetail.idBarang;
    this.barangPenerimaan.idKemasan = pengadaanDetail.idKemasan;
    this.barangPenerimaan.idSatuan = pengadaanDetail.idSatuan;
    this.barangPenerimaan.isiPerKemasan = pengadaanDetail.isiPerKemasan;
    this.barangPenerimaan.jumlahKemasan = pengadaanDetail.jumlahKemasan;
    this.barangPenerimaan.jumlahTotal = pengadaanDetail.jumlahTotal;
    this.barangPenerimaan.keterangan = pengadaanDetail.keterangan;
    this.barangPenerimaan.subtotal = pengadaanDetail.subtotal;

    print(json.encode(pengadaanDetail));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: ListTile(
        title: Text(
          "${widget.index + 1}# - ${pengadaanDetail.barang.namaBarang}" +
              " - ${double.parse(pengadaanDetail.jumlahTotal).toInt()} ${pengadaanDetail.barang.namaKemasan}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text("Tanggal \nKadaluarsa",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  subtitle: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        focusNode: fnExpiredDate,
                        controller: expiredDate,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: false),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          setState(() {
                            barangPenerimaan.expiredDate = expiredDate.text;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: InputDecoration(
                          hintText: "2021-05-05",
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("Jumlah \nditerima",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  subtitle: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        focusNode: fnJumlDiterima,
                        controller: jumlDiterima,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: false),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          setState(() {
                            var diterima = jumlDiterima.text != null
                                ? jumlDiterima.text
                                : 0;

                            if (int.parse(diterima) <=
                                double.parse(barangPenerimaan.jumlahTotal)
                                    .toInt()) {
                              barangPenerimaan.jumlahDiterima = diterima;
                            } else {
                              barangPenerimaan.jumlahDiterima =
                                  barangPenerimaan.jumlahTotal;
                              jumlDiterima.text =
                                  barangPenerimaan.jumlahTotal.toString();
                            }
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: InputDecoration(
                          hintText: "0",
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
