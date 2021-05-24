import 'package:flutter/material.dart';
import 'package:medis/view/obat/obat.dart';
import 'package:medis/view/pesanan/pesanan.dart';

class DashboardMenu {
  StatefulWidget directTo;
  String title;
  String icon;
  bool badge;

  DashboardMenu({this.directTo, this.title, this.icon, this.badge});
}

var obat = DashboardMenu(
    directTo: ObatScreen(),
    title: "Data Obat",
    icon: "assets/images/ic_medicine.png",
    badge: false);

var pengadaan = DashboardMenu(
    directTo: null,
    title: "Penerimaan",
    icon: "assets/images/ic_pharmacy.png",
    badge: false);

var orders = DashboardMenu(
    directTo: Pesanan(),
    title: "Buat Pesanan",
    icon: "assets/images/ic_cart.png",
    badge: true);

var tracking = DashboardMenu(
    directTo: null,
    title: "Tracking",
    icon: "assets/images/ic_ambulance.png",
    badge: false);

final menu = [obat, pengadaan, orders, tracking];
