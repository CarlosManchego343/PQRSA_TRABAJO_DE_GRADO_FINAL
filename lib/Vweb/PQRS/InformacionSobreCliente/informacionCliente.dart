// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobreCliente/columnaIC.dart';

import '../../../constants/Theme.dart';

class informacionCliente extends StatefulWidget {
  @override
  informacionClienteState createState() => informacionClienteState();
}

class informacionClienteState extends State<informacionCliente> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 320.0,
            child: ListView(
              controller: ScrollController(),
              children: <Widget>[
                Column(
                  children: <Widget>[columnaIC()],
                )
              ],
            )));
  }
}
