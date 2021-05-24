import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderInner extends StatefulWidget {
  @override
  _HeaderInnerState createState() => _HeaderInnerState();
}

class _HeaderInnerState extends State<HeaderInner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.width / 1.8,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0)),
            color: Colors.pink[400],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MIRAI SIMFARSAA",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Mobile Information System of \nRSUD Arifin Achmad Pekanbaru",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                top: 0,
                bottom: 0,
                left: 15,
              ),
              Positioned(
                child: Image.asset("assets/images/logo.png",
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 2),
                bottom: 0,
                top: 0,
                right: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
