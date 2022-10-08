// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/BotonesDeVerADetalle/botones.dart';


import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class presentacionBotones extends StatefulWidget {
  final String id;
  presentacionBotones(this.id);
  @override
  presentacionBotonesState createState() =>
      presentacionBotonesState();
}

class presentacionBotonesState
    extends State<presentacionBotones> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[botones(widget.id)],
          )
        ],
      ),
      color: Colores.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colores.columnaCodigos
        ),
        borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(5),
      elevation: 10,
    );
  }
}