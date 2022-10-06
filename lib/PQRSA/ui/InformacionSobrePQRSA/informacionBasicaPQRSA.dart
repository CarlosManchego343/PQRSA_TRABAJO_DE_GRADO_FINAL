// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobrePQRSA/columna1IBPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobrePQRSA/columna2IBPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobrePQRSA/documentosPQRSA.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class informacionBasicaPQRSA extends StatefulWidget {
  final String id;
  informacionBasicaPQRSA(this.id);
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
                        Flexible(flex: 2, child: columna1IBPQRSA(widget.id)),
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
