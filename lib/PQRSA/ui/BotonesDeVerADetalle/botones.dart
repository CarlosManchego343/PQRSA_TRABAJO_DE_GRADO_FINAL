// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/BotonesDeVerADetalle/columnaBotones.dart';
import 'package:pqrsafinal/Cliente/ui/InformacionSobreCliente/columnaIC.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class botones extends StatefulWidget {
  @override
  botonesState createState() => botonesState();
}

class botonesState extends State<botones> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 320.0,
            child: ListView(
              controller: ScrollController(),
              children: <Widget>[
                Column(
                  children: <Widget>[columnaBotones()],
                )
              ],
            )));
  }
}
