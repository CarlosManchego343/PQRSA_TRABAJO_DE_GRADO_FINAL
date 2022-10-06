// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Cliente/ui/InformacionSobreCliente/columnaIC.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class informacionCliente extends StatefulWidget {
  final String id;
  informacionCliente(this.id);
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
                  children: <Widget>[columnaIC(widget.id)],
                )
              ],
            )));
  }
}
