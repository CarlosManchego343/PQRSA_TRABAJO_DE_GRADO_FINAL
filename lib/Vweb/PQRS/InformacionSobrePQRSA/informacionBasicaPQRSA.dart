// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobrePQRSA/columna1IBPQRSA.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobrePQRSA/columna2IBPQRSA.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobrePQRSA/documentosPQRSA.dart';

import '../../../constants/Theme.dart';

class informacionBasicaPQRSA extends StatefulWidget {
  @override
  informacionBasicaPQRSAState createState() => informacionBasicaPQRSAState();
}

class informacionBasicaPQRSAState extends State<informacionBasicaPQRSA> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 300.0,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(flex: 2, child: columna1IBPQRSA()),
                        Flexible(flex: 2, child: columna2IBPQRSA()),
                        Flexible(flex: 2, child: documentosPQRSA())
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
