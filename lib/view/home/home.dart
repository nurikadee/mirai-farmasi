import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:medis/cache/pref.dart';
import 'package:medis/cache/storage.dart';
import 'package:medis/model/response/login_response.dart';
import 'package:medis/utilities/dashboard_menu.dart';
import 'package:medis/view/akun/login.dart';
import 'package:medis/widgets/widget_header_inner.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with LifecycleAware, LifecycleMixin {
  List<DashboardMenu> menus = menu;
  var isLoggedIn = false;

  DataUser dataUser;
  int countCart = 0;

  String nama = "Loading ...";

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
    checkCart();
  }

  checkCart() {
    var dataCart = FarmasiStorage.getCartStorage();
    if (dataCart != null) {
      setState(() {
        this.countCart = dataCart.barang.length;
      });
    }
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    if (event == LifecycleEvent.active) {
      checkIsLoggedIn();
      checkCart();
    }
  }

  void checkIsLoggedIn() {
    if (Pref.checkIsLoggedIn()) {
      setState(() {
        isLoggedIn = Pref.checkIsLoggedIn();
      });

      if (Pref.checkIsLoggedIn()) {
        dataUser = Pref.getUserLogin();
        nama = dataUser.pegawai.namaLengkap;
      }
    } else {
      nama = "User Public";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            child: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(nama,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          brightness: Brightness.light,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                HeaderInner(),
                ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 1.8 - 40,
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80.0),
                          topLeft: Radius.circular(80.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 10),
                            child: Text("Pilihan Menu",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: getGridView(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget getGridView() {
    return Container(
      alignment: Alignment.topCenter,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: menus.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 80),
          itemBuilder: (BuildContext context, int index) {
            index = index;
            return createTile(index, menus[index].title, menus[index].badge);
          }),
    );
  }

  Widget createTile(int index, String title, bool badge) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          callOnTapWithLogin(index);
        } else {
          callOnTapMenu(index);
        }
      },
      child: IntrinsicHeight(
        child: Card(
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: ListTile(
                leading: badge
                    ? Badge(
                        toAnimate: true,
                        animationType: BadgeAnimationType.slide,
                        shape: BadgeShape.circle,
                        badgeContent: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            countCart.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        badgeColor: Colors.blue,
                        child: Image.asset(
                          menus[index].icon,
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        ),
                      )
                    : Image.asset(
                        menus[index].icon,
                        fit: BoxFit.contain,
                        width: 50,
                        height: 50,
                      ),
                title: Text(title,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54))),
          ),
        ),
      ),
    );
  }

  void callOnTapMenu(index) {
    if (menus[index].directTo == null) {
      Toast.show(
        'Fitur sedang dalam tahap pengembangan',
        context,
        backgroundColor: Colors.red,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
      );
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => menus[index].directTo));
    }
  }

  void callOnTapWithLogin(index) {
    if (menus[index].directTo == null) {
      Toast.show(
        'Fitur sedang dalam tahap pengembangan',
        context,
        backgroundColor: Colors.red,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? menus[index].directTo : Login()));
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
